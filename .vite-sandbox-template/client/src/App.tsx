import { Outlet } from 'react-router-dom';

function App() {
  return (
    <div className="h-full overflow-auto">
      <Outlet />
    </div>
  );
}

export default App;
