import { Routes, Route, Navigate } from 'react-router-dom'
import { useAuthStore } from '@/stores/authStore'

// Layouts
import DashboardLayout from '@/components/layout/DashboardLayout'
import AuthLayout from '@/components/layout/AuthLayout'

// Pages
import Dashboard from '@/pages/dashboard/Dashboard'
import POSTerminal from '@/pages/pos/POSTerminal'
import Inventory from '@/pages/inventory/Inventory'
import Transactions from '@/pages/transactions/Transactions'
import Customers from '@/pages/customers/Customers'
import Settings from '@/pages/settings/Settings'
import Login from '@/pages/auth/Login'
import Register from '@/pages/auth/Register'

// Components
import ProtectedRoute from '@/components/ProtectedRoute'
import LoadingSpinner from '@/components/ui/LoadingSpinner'

function App() {
  const { isAuthenticated, isLoading } = useAuthStore()

  if (isLoading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <LoadingSpinner size="lg" />
      </div>
    )
  }

  return (
    <Routes>
      {/* Public Routes */}
      <Route
        path="/auth/*"
        element={
          isAuthenticated ? (
            <Navigate to="/dashboard" replace />
          ) : (
            <AuthLayout>
              <Routes>
                <Route path="login" element={<Login />} />
                <Route path="register" element={<Register />} />
                <Route path="*" element={<Navigate to="login" replace />} />
              </Routes>
            </AuthLayout>
          )
        }
      />

      {/* Protected Routes */}
      <Route
        path="/*"
        element={
          <ProtectedRoute>
            <DashboardLayout>
              <Routes>
                <Route path="dashboard" element={<Dashboard />} />
                <Route path="pos" element={<POSTerminal />} />
                <Route path="inventory" element={<Inventory />} />
                <Route path="transactions" element={<Transactions />} />
                <Route path="customers" element={<Customers />} />
                <Route path="settings" element={<Settings />} />
                <Route path="/" element={<Navigate to="/dashboard" replace />} />
                <Route path="*" element={<Navigate to="/dashboard" replace />} />
              </Routes>
            </DashboardLayout>
          </ProtectedRoute>
        }
      />
    </Routes>
  )
}

export default App// Update 5
// Update 10
// Update 15
// Update 20
// Update 25
// Update 30
