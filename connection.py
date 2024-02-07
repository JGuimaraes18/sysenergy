import os
import pymysql.cursors
import csv
from flask import Flask, g
from dotenv import load_dotenv
from datetime import datetime
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, Paragraph
from reportlab.lib import colors
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.lib.pagesizes import letter


app = Flask(__name__)   

# Carrega as variaveis do env para comunicação com BD #
load_dotenv()

def get_db():
    if 'db' not in g:
        # Conectando ao banco de dados
        g.db = pymysql.connect(
            host=os.getenv('DB_HOST'),
            user=os.getenv('DB_USER'),
            password=os.getenv('DB_PASSWORD'),
            db=os.getenv('DB_NAME')
        )
    return g.db

def close_db(error):
    if 'db' in g:
        # Fechando a conexão com o banco de dados
        g.db.close()

def geraHashMD5(string):
    import hashlib
    string_encoded = string.encode("utf-8")
    hash_object = hashlib.sha256(string_encoded)
    hash_value = hash_object.hexdigest()
    return hash_value

def validaLogin(username,password,cursor):
    cursor.execute('SELECT * FROM operador WHERE operador = % s AND senha = % s', (username, password, )) 
    account = cursor.fetchone()
    return account

def validaRegistro(username, cursor):
    cursor.execute('SELECT * FROM operador WHERE operador = % s', (username,)) 
    account = cursor.fetchone()
    return account

def insereRegistro(username, password, email, enterprise, cursor):
    db=get_db()
    cursor.execute('INSERT INTO operador VALUES (NULL, % s, % s, % s, % s)', (username, password, email, enterprise)) 
    db.commit()
    db.close()

def buscaHomeEletrica(cursor):
    cursor.execute('SELECT DISTINCT supercomputacao.data, supercomputacao.bte1010kwh, datacenter.bte1020kwh, utilidades.bte1030kwh, arCondicionado.bte1040kwh, arCondicionado.bte1050kwh FROM supercomputacao INNER JOIN arCondicionado INNER JOIN datacenter INNER JOIN utilidades WHERE arCondicionado.data = supercomputacao.data AND datacenter.data = supercomputacao.data AND utilidades.data = supercomputacao.data ORDER BY data;') 
    resultSearchE = cursor.fetchall()
    return resultSearchE

def buscaHomeAgua(cursor):
    cursor.execute('SELECT DISTINCT agua.data, agua.cptecGeral, agua.torres, agua.agua FROM agua ORDER BY agua.data;') 
    resultSearchA = cursor.fetchall()
    return resultSearchA

def insereSupercomputacao(data, bte1010kwh, ups05kwh, ups06kwh, bte101000kwh, pdu05kwh, bte1010kw, ups05kw, ups06kw, bte101000kw, pdu05kw, session, cursor):
    try:
        db=get_db()
        operador=session['operador']
        current_date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        cursor.execute('INSERT INTO supercomputacao VALUES (NULL, % s, % s,% s, % s, % s, % s, % s, % s, % s, % s, % s, % s, % s)', (operador, data, current_date, bte1010kwh, bte1010kw, bte101000kwh, bte101000kw, ups05kwh, ups05kw, ups06kwh, ups06kw, pdu05kwh, pdu05kw)) 
        db.commit()
        db.close()
        msg = 'Registro Inserido!'
    except Exception as e:
        msg = 'Erro ao inserir o registro'

    return msg

def buscaSupercomputacao(cursor):
    cursor.execute('SELECT * FROM supercomputacao ORDER BY data DESC') 
    resultSearch = cursor.fetchall()
    return resultSearch

def insereDatacenter(data, bte1020kwh, bte1020kw, bte10200kwh, bte10200kw, ups01kw, ups02kw, session, cursor):
    try:
        db=get_db()        
        operador=session['operador']
        current_date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        cursor.execute('INSERT INTO datacenter VALUES (NULL, % s, % s,% s, % s, % s, % s, % s, % s, % s)', (operador, data, current_date, bte1020kwh, bte1020kw, bte10200kwh, bte10200kw, ups01kw, ups02kw)) 
        db.commit()
        db.close()
        msg = 'Registro Inserido!'
    except Exception as e:
        msg = 'Erro ao inserir o registro'     
    return msg

def buscaDatacenter(cursor):
    cursor.execute('SELECT * FROM datacenter ORDER BY data DESC') 
    resultSearch = cursor.fetchall()
    return resultSearch

def insereUtilidades(data, bte1030kwh, bte1030kw, session, cursor):
    try:
        db=get_db()
        operador=session['operador']
        current_date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        cursor.execute('INSERT INTO utilidades VALUES (NULL, % s, % s,% s, % s, % s)', (operador, data, current_date, bte1030kwh, bte1030kw)) 
        db.commit()
        db.close()        
        msg = 'Registro Inserido!'
    except Exception as e:
        msg = 'Erro ao inserir o registro'     
    return msg

def buscaUtilidades(cursor):
    cursor.execute('SELECT * FROM utilidades ORDER BY data DESC') 
    resultSearch = cursor.fetchall()
    return resultSearch

def insereArCondicionado(data, bte1040kwh, bte1050kwh, bte1040kw, bte1050kw, session, cursor):
    try:
        db=get_db()
        operador=session['operador']
        current_date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        cursor.execute('INSERT INTO arCondicionado VALUES (NULL, % s, % s, % s, % s, % s, % s, % s)', (operador, data, current_date, bte1040kwh, bte1050kwh, bte1040kw, bte1050kw)) 
        db.commit()
        db.close()
        msg = 'Registro Inserido!'
    except Exception as e:
        msg = 'Erro ao inserir o registro'     
    return msg

def buscaArCondicionado(cursor):
    cursor.execute('SELECT * FROM arCondicionado ORDER BY data DESC') 
    resultSearch = cursor.fetchall()
    return resultSearch

def insereCAG(data, bte10515kwh, bte10401kwh, bte10515kw, bte10401kw, session, cursor):
    try:
        db=get_db()
        operador=session['operador']
        current_date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        cursor.execute('INSERT INTO cag VALUES (NULL, % s, % s, % s, % s, % s, % s, % s)', (operador, data, current_date, bte10515kwh, bte10401kwh, bte10515kw, bte10401kw)) 
        db.commit()
        db.close()
        msg = 'Registro Inserido!'
    except Exception as e:
        msg = 'Erro ao inserir o registro'     
    return msg

def buscaCAG(cursor):
    cursor.execute('SELECT * FROM cag ORDER BY data DESC') 
    resultSearch = cursor.fetchall()
    return resultSearch

def insereAgua(data, cptecGeral, torres, agua, session, cursor):
    try:
        db=get_db()
        operador=session['operador']
        current_date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        cursor.execute('INSERT INTO agua VALUES (NULL, % s, % s, % s, % s, % s, % s)', (operador, data, current_date, cptecGeral, torres, agua)) 
        db.commit()
        db.close()
        msg = 'Registro Inserido!'
    except Exception as e:
        msg = 'Erro ao inserir o registro'     
    return msg

def buscaAgua(cursor):
    cursor.execute('SELECT * FROM agua ORDER BY data DESC') 
    resultSearch = cursor.fetchall()
    return resultSearch

def insereGerador(data, g1hora, g1kwh, g1tempAgua, g1tempOleo, g1batA, g1batB, g1batTotal, g2hora, g2kwh, g2tempAgua, g2tempOleo, g2batA, g2batB, g2batTotal, g3hora, g3kwh, g3tempAgua, g3tempOleo, g3batA, g3batB, g3batTotal, g4hora, g4kwh, g4tempAgua, g4tempOleo, g4batA, g4batB, g4batTotal, session, cursor):
    try:
        db=get_db()
        operador=session['operador']
        current_date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        cursor.execute('INSERT INTO gerador VALUES (NULL, % s, % s, % s, % s, % s, % s, % s, % s, % s, % s , % s, % s, % s, % s, % s, % s, % s, % s, % s, % s, % s, % s, % s, % s, % s, % s, % s, % s, % s, % s, % s)', (operador, data, current_date, g1hora, g1kwh, g1tempAgua, g1tempOleo, g1batA, g1batB, g1batTotal, g2hora, g2kwh, g2tempAgua, g2tempOleo, g2batA, g2batB, g2batTotal, g3hora, g3kwh, g3tempAgua, g3tempOleo, g3batA, g3batB, g3batTotal, g4hora, g4kwh, g4tempAgua, g4tempOleo, g4batA, g4batB, g4batTotal)) 
        db.commit()
        db.close()
        msg = 'Registro Inserido!'
    except Exception as e:
        msg = 'Erro ao inserir o registro'     
    return msg

def buscaGerador(cursor):
    cursor.execute('SELECT * FROM gerador ORDER BY data DESC') 
    resultSearch = cursor.fetchall()
    return resultSearch

def insereCombustivel(data, taCM, taLitro, tbCM, tbLitro, tcCM, tcLitro, totalLitro, oleoIn, oleoOut, session, cursor):
    try:
        db=get_db()
        operador=session['operador']
        current_date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        cursor.execute('INSERT INTO combustivel VALUES (NULL, % s, % s, % s, % s, % s, % s, % s, % s, % s, % s , % s, % s)', (operador, data, current_date, taCM, taLitro, tbCM, tbLitro, tcCM, tcLitro, totalLitro, oleoIn, oleoOut)) 
        db.commit()
        db.close()
        msg = 'Registro Inserido!'
    except Exception as e:
        msg = 'Erro ao inserir o registro'     
    return msg

def buscaCombustivel(cursor):
    cursor.execute('SELECT data, taLitro, tbLitro, tcLitro, totalLitro FROM combustivel ORDER BY data DESC') 
    resultSearch = cursor.fetchall()
    return resultSearch

def insereObservacao(data, codigo, observacao, session, cursor):

    try:
        db=get_db()
        operador=session['operador']
        current_date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        cursor.execute('INSERT INTO observacoes VALUES (NULL, % s, % s, % s, % s, % s)', (operador, data, current_date, codigo, observacao)) 
        db.commit()
        db.close()
        msg = 'Registro Inserido!'
    except Exception as e:
        msg = 'Erro ao inserir o registro'     
    return msg

def buscaLitrosCombustivel(valor, tipo, cursor):
    query = f"SELECT `{tipo}` FROM tanques WHERE cm = %s"    
    cursor.execute(query, (valor,))
    resultSearch = cursor.fetchall()
    return resultSearch

def buscaRelatorio(cursor, data_inicial, data_final, tabela, colunas):
    query = f"SELECT {colunas} FROM {tabela} WHERE data >= %s AND data <= %s"
    cursor.execute(query, (data_inicial, data_final))
    resultSearch = cursor.fetchall()
    return resultSearch

def gerar_pdf(resultSearch, tabela, cabecalho):
    pdf = SimpleDocTemplate(f"relatorio_{tabela}.pdf", pagesize=letter)
    elements = []
    styles = getSampleStyleSheet()
    elements.append(Paragraph('Relatório', styles['Title']))

    # data = [['Data','BTE-1010 KWh','BTE-1010 KW']]
    data = [cabecalho]

    for row in resultSearch:
        data.append(list(row))

    table = Table(data)
    table.setStyle(TableStyle([('BACKGROUND', (0, 0), (-1, 0), colors.lightsteelblue),
                               ('TEXTCOLOR', (0, 0), (-1, 0), colors.black),
                               ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
                               ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
                               ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
                               ('BACKGROUND', (0, 1), (-1, -1), colors.white),
                               ('GRID', (0, 0), (-1, -1), 1, colors.black)]))

    elements.append(table)
    pdf.build(elements)
 
def gerar_csv(resultSearch, tabela, cabecalho):
    with open(f"relatorio_{tabela}.csv", mode='w', newline='') as file:
        writer = csv.writer(file, delimiter=';')
        writer.writerow(cabecalho) 
        writer.writerows(resultSearch)
