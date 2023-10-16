import * as mdb from 'mdb-ui-kit'; // lib


const sidebar = document.querySelector('#sidebar');
const toggleSidebar = document.querySelector('#toggle-sidebar');

toggleSidebar.onclick = () => {
  sidebar.classList.toggle('collapsed');
  toggleSidebar.innerText = sidebar.classList.contains('collapsed') ? '>' : '<';
};



