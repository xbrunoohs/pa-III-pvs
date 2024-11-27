import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Login from '../pages/Login/Login';
import Home from '../pages/Home/Home';
import CadastroCompra from '../pages/CadastroCompra/CadastroCompra';
import Estoque from '../pages/Estoque/Estoque';
import HistoricoCompras from '../pages/HistoricoCompras/HistoricoCompras';
import CadastrarArmazenamento from '../pages/CadastrarArmazenamento/CadastrarArmazenamento';

const AppRoutes = () => {
    return (
      <Router>
        <Routes>
          <Route path="/" element={<Login />} />
          <Route path="/home" element={<Home />} />
          <Route path="/cadastro-compra" element={<CadastroCompra />} />
          <Route path="/estoque" element={<Estoque />} />
          <Route path="/historico-compras" element={<HistoricoCompras />} />
          <Route path="/cadastrar-armazenamento" element={<CadastrarArmazenamento />} />
        </Routes>
      </Router>
    );
  };
  
  export default AppRoutes;