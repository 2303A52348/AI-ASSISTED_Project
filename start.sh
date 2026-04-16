#!/bin/bash
echo "🚀 Starting FinanceAI..."
echo ""
echo "Starting backend on port 5000..."
cd backend && node server.js &
BACKEND_PID=$!
sleep 2
echo "Starting frontend on port 3000..."
cd ../frontend && npm start &
FRONTEND_PID=$!
echo ""
echo "✅ FinanceAI is running!"
echo "   Frontend: http://localhost:3000"
echo "   Backend:  http://localhost:5000"
echo ""
echo "Press Ctrl+C to stop all services"
wait
