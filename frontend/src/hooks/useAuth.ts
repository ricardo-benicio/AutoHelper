import { useState, useEffect } from 'react';
import { User, AuthResponse } from '@/types';

interface UseAuthReturn {
  user: User | null;
  isAuthenticated: boolean;
  isLoading: boolean;
  login: (email: string, password: string) => Promise<boolean>;
  logout: () => void;
  register: (email: string, password: string, name: string) => Promise<boolean>;
}

export const useAuth = (): UseAuthReturn => {
  const [user, setUser] = useState<User | null>(null);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    // Verificar se há token salvo
    const token = localStorage.getItem('auth_token');
    if (token) {
      // Aqui você pode fazer uma chamada para validar o token
      // Por enquanto, vamos apenas simular
      setIsLoading(false);
    } else {
      setIsLoading(false);
    }
  }, []);

  const login = async (email: string, password: string): Promise<boolean> => {
    try {
      setIsLoading(true);
      // Aqui você faria a chamada para a API
      // const response = await apiService.post<AuthResponse>('/auth/login', { email, password });
      
      // Simulação por enquanto
      const mockUser: User = {
        id: 1,
        email,
        name: 'Usuário Teste',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
      };
      
      localStorage.setItem('auth_token', 'mock_token');
      setUser(mockUser);
      return true;
    } catch (error) {
      console.error('Erro no login:', error);
      return false;
    } finally {
      setIsLoading(false);
    }
  };

  const logout = () => {
    localStorage.removeItem('auth_token');
    setUser(null);
  };

  const register = async (email: string, password: string, name: string): Promise<boolean> => {
    try {
      setIsLoading(true);
      // Aqui você faria a chamada para a API
      // const response = await apiService.post<AuthResponse>('/auth/register', { email, password, name });
      
      // Simulação por enquanto
      const mockUser: User = {
        id: 1,
        email,
        name,
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
      };
      
      localStorage.setItem('auth_token', 'mock_token');
      setUser(mockUser);
      return true;
    } catch (error) {
      console.error('Erro no registro:', error);
      return false;
    } finally {
      setIsLoading(false);
    }
  };

  return {
    user,
    isAuthenticated: !!user,
    isLoading,
    login,
    logout,
    register,
  };
};
