from flask import Flask, render_template, request, redirect, url_for, session , flash, jsonify#, send_file, make_response
from gevent.pywsgi import WSGIServer
from connection import *  
import re 
import zipfile
import base64
import io

  
app = Flask(__name__) 
  
app.secret_key = 'Inpe2023'
  
@app.route('/')   
@app.route('/login', methods =['GET', 'POST']) 
def login(): 
    msg = '' 
    if request.method == 'POST' and 'operador' in request.form and 'senha' in request.form: 
        db=get_db()
        cursor = db.cursor()
        username = request.form['operador'] 
        password = geraHashMD5(request.form['senha'])
        account=validaLogin(username,password, cursor)
        db.close()
        
        if account: 
            session['loggedin'] = True
            session['id'] = account[0] 
            session['operador'] = account[1] 
            msg = 'Logged in successfully !'
            return redirect(url_for('index'))
        else: 
            msg = 'Incorrect username / password !'
    return render_template('login.html', msg = msg) 
  
@app.route('/register', methods =['GET', 'POST']) 
def register(): 
    msg = '' 
    if request.method == 'POST' and 'operador' in request.form and 'senha' in request.form and 'email' in request.form and 'empresa' in request.form: 
        db=get_db()
        cursor = db.cursor()
        username = request.form['operador'] 
        password = geraHashMD5(request.form['senha'])
        email = request.form['email'] 
        enterpise = request.form['empresa']   
        account=validaRegistro(username, cursor)
        if account: 
            msg = 'Account already exists !'
        elif not re.match(r'[^@]+@[^@]+\.[^@]+', email): 
            msg = 'Invalid email address !'
        elif not re.match(r'[A-Za-z0-9]+', username): 
            msg = 'Nome deve conter apenas caracteres e números!'
        else: 
            insereRegistro(username, password, email, enterpise, cursor)
            flash('You have successfully registered !')
            # return redirect(url_for('index'))
    elif request.method == 'POST': 
        msg = 'Please fill out the form !'
    return render_template('register.html', msg = msg) 

@app.route("/usuario") 
def usuario(): 
    # if 'loggedin' in session: 
    #     db=get_db()
    #     cursor = db.cursor()
    #     cursor.execute('SELECT * FROM operador WHERE id = % s', (session['id'], )) 
    #     account = cursor.fetchone()     
    #     db.close()
    #     return render_template("usuario.html", account = account) 
    # return redirect(url_for('login')) 
    return render_template("index.html")
  
@app.route("/index") 
def index(): 
    if 'loggedin' in session:  
        db=get_db()
        cursor = db.cursor()
        resultSearchE = buscaHomeEletrica(cursor)
        resultSearchA = buscaHomeAgua(cursor)
        db.close()
        return render_template("index.html", resultSearchE = resultSearchE, resultSearchA = resultSearchA) 
    return redirect(url_for('login')) 
  
@app.route("/supercomputacao", methods =['GET', 'POST'])
def supercomputacao():
    if 'loggedin' in session: 
        db=get_db()
        cursor = db.cursor()
        msg=request.args.get('msg')
        if msg is None:
            msg=''

        resultSearch = buscaSupercomputacao(cursor)
        
        if request.method == 'POST' and 'data' in request.form and 'bte1010-kwh' in request.form and 'ups05-kwh' in request.form and 'ups06-kwh' in request.form and 'bte101000-kwh' in request.form and 'pdu05-kwh' in request.form and 'bte1010-kw' in request.form and 'ups05-kw' in request.form and 'ups06-kw' in request.form and 'bte101000-kw' in request.form and 'pdu05-kw' in request.form: 
            data = request.form['data'] 
            bte1010kwh = request.form['bte1010-kwh'] 
            bte101000kwh = request.form['bte101000-kwh']   
            ups05kwh = request.form['ups05-kwh'] 
            ups06kwh = request.form['ups06-kwh'] 
            pdu05kwh = request.form['pdu05-kwh']
            bte1010kw = request.form['bte1010-kw'] 
            bte101000kw = request.form['bte101000-kw']   
            ups05kw = request.form['ups05-kw'] 
            ups06kw = request.form['ups06-kw'] 
            pdu05kw = request.form['pdu05-kw']

            msg = insereSupercomputacao(data, bte1010kwh, ups05kwh, ups06kwh, bte101000kwh, pdu05kwh, bte1010kw, ups05kw, ups06kw, bte101000kw, pdu05kw, session, cursor)
            return redirect(url_for('sucesso', msg = msg, area='supercomputacao'))     
        db.close()
        return render_template("supercomputacao.html", msg = msg, resultSearch = resultSearch) 
    else:
        return redirect(url_for('login')) 
    
@app.route("/datacenter", methods =['GET', 'POST'])
def datacenter():
    if 'loggedin' in session: 
        msg=request.args.get('msg')
        if msg is None:
            msg=''

        db=get_db()
        cursor = db.cursor()        
        resultSearch = buscaDatacenter(cursor)

        if request.method == 'POST' and 'data' in request.form and 'bte1020kwh' in request.form and 'bte10200kwh' in request.form and 'bte1020kw' in request.form and 'bte10200kw' in request.form and 'ups01kw' in request.form and 'ups02kw': 
            data = request.form['data'] 
            bte1020kwh = request.form['bte1020kwh'] 
            bte1020kw = request.form['bte1020kw'] 
            ups01kw = request.form['ups01kw'] 
            ups02kw = request.form['ups02kw'] 
            bte10200kwh = request.form['bte10200kwh']   
            bte10200kw = request.form['bte10200kw']   
            msg = insereDatacenter(data, bte1020kwh, bte1020kw, bte10200kwh, bte10200kw, ups01kw, ups02kw, session, cursor)
            return redirect(url_for('sucesso', msg = msg, area='datacenter'))     
        db.close()
        return render_template("datacenter.html", msg = msg, resultSearch = resultSearch) 
    else:
        return redirect(url_for('login')) 

@app.route("/utilidades", methods =['GET', 'POST'])
def utilidades():
    if 'loggedin' in session: 
        msg=request.args.get('msg')
        if msg is None:
            msg=''

        db=get_db()
        cursor = db.cursor()  
        resultSearch = buscaUtilidades(cursor)
        
        if request.method == 'POST' and 'data' in request.form and 'bte1030kwh' in request.form and 'bte1030kw' in request.form: #and 'obs_utilidades' in request.form: 
            data = request.form['data'] 
            bte1030kwh = request.form['bte1030kwh'] 
            bte1030kw = request.form['bte1030kw'] 
            msg = insereUtilidades(data, bte1030kwh, bte1030kw, session, cursor)
            return redirect(url_for('sucesso', msg = msg, area='utilidades'))     
        return render_template("utilidades.html", msg = msg, resultSearch = resultSearch) 
    else:
        return redirect(url_for('login')) 

@app.route("/arcondicionado", methods =['GET', 'POST'])
def arcondicionado():
    if 'loggedin' in session: 
        msg=request.args.get('msg')
        if msg is None:
            msg=''        
        
        db=get_db()
        cursor = db.cursor()         
        resultSearch = buscaArCondicionado(cursor)

        if request.method == 'POST' and 'data' in request.form and 'bte1040kwh' in request.form and 'bte1050kwh' in request.form and 'bte1040kw' in request.form and 'bte1050kw' in request.form : 
            data = request.form['data'] 
            bte1040kwh = request.form['bte1040kwh'] 
            bte1050kwh = request.form['bte1050kwh'] 
            bte1040kw = request.form['bte1040kw'] 
            bte1050kw = request.form['bte1050kw'] 
            
            msg = insereArCondicionado(data, bte1040kwh, bte1050kwh, bte1040kw, bte1050kw, session, cursor)
            return redirect(url_for('sucesso', msg = msg, area='arcondicionado'))     
        db.close()
        return render_template("arCondicionado.html", msg = msg, resultSearch = resultSearch) 
    else:
        return redirect(url_for('login')) 

@app.route("/cag", methods =['GET', 'POST'])
def cag():
    if 'loggedin' in session: 
        msg=request.args.get('msg')
        if msg is None:
            msg=''              
        db=get_db()
        cursor = db.cursor()  
        resultSearch = buscaCAG(cursor)

        if request.method == 'POST' and 'data' in request.form and 'bte10515kwh' in request.form and 'bte10401kwh' in request.form and 'bte10515kw' in request.form and 'bte10401kw' in request.form: 
            data = request.form['data'] 
            bte10515kwh = request.form['bte10515kwh'] 
            bte10401kwh = request.form['bte10401kwh'] 
            bte10515kw = request.form['bte10515kw'] 
            bte10401kw = request.form['bte10401kw']             
            msg = insereCAG(data, bte10515kwh, bte10401kwh, bte10515kw, bte10401kw, session, cursor)
            return redirect(url_for('sucesso', msg = msg, area='cag'))     
        db.close()
        return render_template("cag.html", msg = msg, resultSearch = resultSearch) 
    else:
        return redirect(url_for('login')) 
    
@app.route("/agua", methods =['GET', 'POST'])
def agua():
    if 'loggedin' in session: 
        msg=request.args.get('msg')
        if msg is None:
            msg=''         

        db=get_db()
        cursor = db.cursor()  
        resultSearch = buscaAgua(cursor)

        if request.method == 'POST' and 'data' in request.form and 'cptecGeral' in request.form and 'torres' in request.form and 'agua' in request.form : 
            data = request.form['data'] 
            cptecGeral = request.form['cptecGeral'] 
            torres = request.form['torres'] 
            agua = request.form['agua'] 
            
            msg = insereAgua(data, cptecGeral, torres, agua, session, cursor)
            return redirect(url_for('sucesso', msg = msg, area='agua'))     
        db.close()
        return render_template("agua.html", msg = msg, resultSearch = resultSearch) 
    else:
        return redirect(url_for('login')) 
   
@app.route("/gerador", methods =['GET', 'POST']) 
def gerador():
    if 'loggedin' in session: 
        msg=request.args.get('msg')
        if msg is None:
            msg=''         

        db=get_db()
        cursor = db.cursor()  
        resultSearch = buscaGerador(cursor)

        if request.method == 'POST' and 'data' in request.form and 'g1-hora' in request.form and 'g1-kwh' in request.form and 'g1-tempAgua' in request.form and 'g1-tempOleo' in request.form and 'g1-batA' in request.form and 'g1-batB' in request.form and 'g1-batTotal' in request.form and 'g2-hora' in request.form and 'g2-kwh' in request.form and 'g2-tempAgua' in request.form and 'g2-tempOleo' in request.form and 'g2-batA' in request.form and 'g2-batB' in request.form and 'g2-batTotal' in request.form and 'g3-hora' in request.form and 'g3-kwh' in request.form and 'g3-tempAgua' in request.form and 'g3-tempOleo' in request.form and 'g3-batA' in request.form and 'g3-batB' in request.form and 'g3-batTotal' in request.form and 'g4-hora' in request.form and 'g4-kwh' in request.form and 'g4-tempAgua' in request.form and 'g4-tempOleo' in request.form and 'g4-batA' in request.form and 'g4-batB' in request.form and 'g4-batTotal' in request.form:

            data = request.form['data']
            g1hora = request.form['g1-hora'] 
            g1kwh = request.form['g1-kwh'] 
            g1tempAgua = request.form['g1-tempAgua'] 
            g1tempOleo = request.form['g1-tempOleo'] 
            g1batA = request.form['g1-batA'] 
            g1batB = request.form['g1-batB'] 
            g1batTotal = request.form['g1-batTotal'] 

            g2hora = request.form['g2-hora'] 
            g2kwh = request.form['g2-kwh'] 
            g2tempAgua = request.form['g2-tempAgua'] 
            g2tempOleo = request.form['g2-tempOleo'] 
            g2batA = request.form['g2-batA'] 
            g2batB = request.form['g2-batB'] 
            g2batTotal = request.form['g2-batTotal'] 

            g3hora = request.form['g3-hora'] 
            g3kwh = request.form['g3-kwh'] 
            g3tempAgua = request.form['g3-tempAgua'] 
            g3tempOleo = request.form['g3-tempOleo'] 
            g3batA = request.form['g3-batA'] 
            g3batB = request.form['g3-batB'] 
            g3batTotal = request.form['g3-batTotal'] 

            g4hora = request.form['g4-hora'] 
            g4kwh = request.form['g4-kwh'] 
            g4tempAgua = request.form['g4-tempAgua'] 
            g4tempOleo = request.form['g4-tempOleo'] 
            g4batA = request.form['g4-batA'] 
            g4batB = request.form['g4-batB'] 
            g4batTotal = request.form['g4-batTotal'] 

            msg = insereGerador(data, g1hora, g1kwh, g1tempAgua, g1tempOleo, g1batA, g1batB, g1batTotal, g2hora, g2kwh, g2tempAgua, g2tempOleo, g2batA, g2batB, g2batTotal, g3hora, g3kwh, g3tempAgua, g3tempOleo, g3batA, g3batB, g3batTotal, g4hora, g4kwh, g4tempAgua, g4tempOleo, g4batA, g4batB, g4batTotal, session, cursor)
            return redirect(url_for('sucesso', msg = msg, area='gerador'))     
        db.close()
        return render_template("gerador.html", msg = msg, resultSearch = resultSearch) 
    else:
        return redirect(url_for('login')) 
    
@app.route("/combustivel", methods =['GET', 'POST']) 
def combustivel():
    if 'loggedin' in session: 
        msg=request.args.get('msg')
        if msg is None:
            msg=''         
        
        db=get_db()
        cursor = db.cursor()
           
        resultSearch = buscaCombustivel(cursor)
        if request.method == 'POST' and 'data' in request.form and 'tA-cm' in request.form and 'tA-litro' in request.form and 'tB-cm' in request.form and 'tB-litro' in request.form and 'tC-cm' in request.form and 'tC-litro' in request.form and 'tTotal-litro' in request.form and 'oleoIn' in request.form and 'oleoOut' in request.form: 
            data = request.form['data']
            taCM = request.form['tA-cm'] 
            taLitro = request.form['tA-litro'] 
            tbCM = request.form['tB-cm'] 
            tbLitro = request.form['tB-litro'] 
            tcCM = request.form['tC-cm'] 
            tcLitro = request.form['tC-litro'] 
            totalLitro = request.form['tTotal-litro'] 
            oleoIn = request.form['oleoIn'] 
            oleoOut = request.form['oleoOut']
                
            msg = insereCombustivel(data, taCM, taLitro, tbCM, tbLitro, tcCM, tcLitro, totalLitro, oleoIn, oleoOut, session, cursor)
            return redirect(url_for('sucesso', msg = msg, area='combustivel'))   
        db.close()
        return render_template("combustivel.html", msg = msg, resultSearch = resultSearch) 
    else:
        return redirect(url_for('login')) 

@app.route("/observacoes", methods =['GET', 'POST'])
def observacoes():

    db=get_db()
    cursor = db.cursor()
    data = request.form['data']
    if 'obs_supercomputacao' in request.form:
        page='supercomputacao'
        observacao = request.form['obs_supercomputacao']
        codigo='1'

    if 'obs_datacenter' in request.form:
        page='datacenter'
        observacao = request.form['obs_datacenter']
        codigo='2'

    if 'obs_utilidades' in request.form:
        page='utilidades'
        observacao = request.form['obs_utilidades']
        codigo='3'

    if 'obs_arcondicionado' in request.form:
        page='arcondicionado'
        observacao = request.form['obs_arcondicionado']
        codigo='4'

    if 'obs_cag' in request.form:
        page='cag'
        observacao = request.form['obs_cag']
        codigo='5'

    if 'obs_agua' in request.form:
        page='agua'
        observacao = request.form['obs_agua']
        codigo='6'

    if 'obs_gerador' in request.form:
        page='gerador'
        observacao = request.form['obs_gerador']
        codigo='7'

    if 'obs_combustivel' in request.form:
        page='combustivel'
        observacao = request.form['obs_combustivel']
        codigo='8'
                   
    msg = insereObservacao(data, codigo, observacao, session, cursor)

    return redirect(url_for(page, msg = msg))          
 
@app.route("/observacao", methods =['GET', 'POST'])
def observacao():
    return render_template("index.html")

@app.route("/sucesso", methods =['GET', 'POST'])
def sucesso():
    msg=request.args.get('msg')
    area=request.args.get('area')
    return redirect(url_for(area, msg = msg))

@app.route("/update", methods =['GET', 'POST']) 
def update(): 
    msg = '' 
    if 'loggedin' in session: 
        if request.method == 'POST' and 'username' in request.form and 'password' in request.form and 'email' in request.form and 'address' in request.form and 'city' in request.form and 'country' in request.form and 'postalcode' in request.form and 'organisation' in request.form: 
            db=get_db()
            cursor = db.cursor()  
            username = request.form['username'] 
            password = request.form['password'] 
            email = request.form['email'] 
            organisation = request.form['organisation']   
            address = request.form['address'] 
            city = request.form['city'] 
            state = request.form['state'] 
            country = request.form['country']     
            postalcode = request.form['postalcode']  
            cursor.execute('SELECT * FROM accounts WHERE username = % s', (username, )) 
            account = cursor.fetchone() 
            if account: 
                msg = 'Account already exists !'
            elif not re.match(r'[^@]+@[^@]+\.[^@]+', email): 
                msg = 'Invalid email address !'
            elif not re.match(r'[A-Za-z0-9]+', username): 
                msg = 'name must contain only characters and numbers !'
            else: 
                cursor.execute('UPDATE accounts SET  username =% s, password =% s, email =% s, organisation =% s, address =% s, city =% s, state =% s, country =% s, postalcode =% s WHERE id =% s', (username, password, email, organisation, address, city, state, country, postalcode, (session['id'], ), )) 
                msg = 'You have successfully updated !'
                db.close()
        elif request.method == 'POST': 
            msg = 'Please fill out the form !'
        return render_template("update.html", msg = msg) 
    return redirect(url_for('login')) 

@app.route('/buscar_litros', methods=['POST'])
def buscar_litros():
    cm_valor = int(request.form['cm_valor'])
    tipo = request.form['tipo']
    db=get_db()
    cursor = db.cursor()   
    litros_valor = buscaLitrosCombustivel(cm_valor, tipo, cursor)
    db.close()
    return jsonify({'litros_valor': litros_valor})


@app.route("/relatorio", methods=['POST'])
def relatorio():
    db = get_db()
    cursor = db.cursor()
    data_inicial = request.form['data_inicial']
    data_final = request.form['data_final']

    if 'rel_supercomputacao' in request.form:
        tabela = 'supercomputacao'
        cabecalho = ['Data', 'BTE-1010KWh', 'BTE-1010KW']
        colunas = 'data,bte1010kwh,bte1010kw'

    if 'rel_datacenter' in request.form:
        tabela = 'datacenter'
        cabecalho = ['Data', 'BTE-1020KWh', 'BTE-1020KW', 'BTE-10200KWh', 'BTE-10200KW', 'UPS-01KW', 'UPS-02KW']
        colunas = 'data,bte1020kwh,bte1020kw,bte1020kwh,bte1020kw,ups01kw,ups02kw'
    
    if 'rel_utilidades' in request.form:
        tabela = 'utilidades'
        cabecalho = ['Data', 'BTE-1030KWh', 'BTE-1030KW']
        colunas = 'data,bte1030kwh,bte1030kw'
    
    if 'rel_arcondicionado' in request.form:
        tabela = 'arCondicionado'
        cabecalho = ['Data', 'BTE-1040KWh', 'BTE-1040KW', 'BTE-1050KWh', 'BTE-1050KW']
        colunas = 'data,bte1040kwh,bte1040kw,bte1050kwh,bte1050kw'
    
    if 'rel_cag' in request.form:
        tabela = 'cag'
        cabecalho = ['Data', 'BTE-10515KWh', 'BTE-10515KW', 'BTE-10401KWh', 'BTE-10401KW']
        colunas = 'data,bte10515kwh,bte10515kw,bte10401kwh,bte10401kw'

    if 'rel_agua' in request.form:
        tabela = 'agua'
        cabecalho = ['Data', 'CPTEC Geral', 'Torres de Resfriamento', 'Água Gelada']
        colunas = 'data,cptecGeral,torres,agua'

    if 'rel_combustivel' in request.form:
        tabela = 'combustivel'
        cabecalho = ['Data', 'Tanque Externo (A)', 'Tanque Externo (B)', 'Tanque Externo (C)', 'Total (A + B + C)']
        colunas = 'data,taLitro,tbLitro,tcLitro,totalLitro'

    resultSearch = buscaRelatorio(cursor, data_inicial, data_final, tabela, colunas)
    gerar_pdf(resultSearch, tabela, cabecalho)
    gerar_csv(resultSearch, tabela, cabecalho)

    name_zip = f"relatorios_{tabela}.zip"

    with zipfile.ZipFile(name_zip, 'w') as zip_file:
        zip_file.write(f"relatorio_{tabela}.pdf")
        zip_file.write(f"relatorio_{tabela}.csv")

    with open(name_zip, 'rb') as file:
        zip_data = base64.b64encode(file.read()).decode('utf-8')

    return jsonify({'zipData': zip_data})

@app.route('/logout') 
def logout(): 
   session.pop('loggedin', None) 
   session.pop('id', None) 
   session.pop('operador', None) 
   return redirect(url_for('login')) 
  
if __name__ == '__main__':
    # Production
    http_server = WSGIServer(('', 5002), app)
    http_server.serve_forever()    