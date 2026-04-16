# 💰 FinanceAI — AI-Powered Personal Finance Tracker

A full-stack personal finance application with MongoDB, Express.js backend, React frontend, AI insights, and 170+ currency converter.

---

## 🚀 Quick Start

### Prerequisites
- Node.js 16+ installed
- MongoDB running locally (or MongoDB Atlas URI)

### 1. Backend Setup

```bash
cd backend
npm install
cp .env.example .env
# Edit .env with your MongoDB URI and settings
npm start
```

Backend runs on **http://localhost:5000**

### 2. Frontend Setup

```bash
cd frontend
npm install
npm start
```

Frontend runs on **http://localhost:3000**

---

## ⚙️ Environment Variables (backend/.env)

| Variable | Description | Default |
|----------|-------------|---------|
| `PORT` | Server port | `5000` |
| `MONGODB_URI` | MongoDB connection string | `mongodb://localhost:27017/finance_tracker` |
| `JWT_SECRET` | Secret key for JWT tokens | Change this! |
| `JWT_EXPIRE` | Token expiry | `7d` |
| `EXCHANGE_API_KEY` | exchangerate-api.com key (optional) | Falls back to frankfurter.app (free) |
| `ADMIN_CODE` | Code required for admin registration | `ADMIN2024` |

---

## 🔐 Authentication

### User Registration
- Go to the login page → Click "Register" → Choose "User" role
- Fill in Name, Email, Password

### Admin Registration
- Go to Register → Choose "Admin" role
- Enter the **Admin Code**: `ADMIN2024` (change in `.env` as `ADMIN_CODE`)
- Admins get access to the Admin Panel with full user management

---

## 💱 Currency Converter

Supports **170+ world currencies** including:
- All major currencies (USD, EUR, GBP, JPY, etc.)
- All Gulf currencies (AED, SAR, QAR, KWD, BHD, OMR)
- Asian currencies (INR, CNY, JPY, KRW, SGD, etc.)
- African currencies (NGN, KES, ZAR, GHS, etc.)
- Latin American currencies (BRL, MXN, ARS, CLP, etc.)
- Pacific currencies (AUD, NZD, FJD, etc.)
- CFA Franc zones (XOF, XAF)
- And many more!

**Conversion APIs used (in priority order):**
1. exchangerate-api.com (requires free API key)
2. frankfurter.app (completely free, no key needed)

---

## 📊 Features

| Feature | Description |
|---------|-------------|
| 🔐 Auth | JWT-based login/register with User & Admin roles |
| 📈 Dashboard | Income vs expense charts, category pie chart, recent transactions |
| 💳 Transactions | Full CRUD with filters, categories, multi-currency |
| 📊 Budget | Monthly budget limits per category with progress tracking |
| 💱 Currency | Real-time conversion across 170+ currencies |
| 🤖 AI Insights | Smart spending analysis, savings rate, tips |
| ⚙️ Admin Panel | User management, system stats, activate/deactivate users |

---

## 🛠 API Endpoints

### Auth
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/auth/register` | Register user/admin |
| POST | `/api/auth/login` | Login |
| GET | `/api/auth/me` | Get current user |

### Transactions
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/transactions` | List transactions |
| POST | `/api/transactions` | Create transaction |
| PUT | `/api/transactions/:id` | Update |
| DELETE | `/api/transactions/:id` | Delete |
| GET | `/api/transactions/analytics/summary` | Monthly summary |
| GET | `/api/transactions/analytics/trend` | 6-month trend |

### Currency
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/currency/list` | All 170+ currencies |
| POST | `/api/currency/convert` | Convert currency |
| GET | `/api/currency/rates/:base` | Live rates |

### Admin (admin role required)
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/admin/users` | All users |
| GET | `/api/admin/stats` | System statistics |
| PATCH | `/api/admin/users/:id/toggle` | Activate/deactivate |
| DELETE | `/api/admin/users/:id` | Delete user |

---

## 🗂 Project Structure

```
finance-tracker/
├── backend/
│   ├── models/
│   │   ├── User.js          # User schema (bcrypt password)
│   │   ├── Transaction.js   # Transaction schema
│   │   └── Budget.js        # Budget schema
│   ├── routes/
│   │   ├── auth.js          # Authentication routes
│   │   ├── transactions.js  # Transaction CRUD + analytics
│   │   ├── budget.js        # Budget management
│   │   ├── currency.js      # Currency converter (170+ currencies)
│   │   ├── admin.js         # Admin-only routes
│   │   └── ai.js            # AI insights
│   ├── middleware/
│   │   └── auth.js          # JWT protect + adminOnly middleware
│   ├── .env.example
│   └── server.js
└── frontend/
    └── src/
        ├── context/
        │   └── AuthContext.js  # Global auth state + API client
        ├── pages/
        │   ├── AuthPage.js      # Login + Register (User/Admin)
        │   ├── Dashboard.js     # Overview with charts
        │   ├── Transactions.js  # Transaction management
        │   ├── Budget.js        # Budget tracking
        │   ├── CurrencyConverter.js  # 170+ currency converter
        │   ├── AIInsights.js    # AI spending analysis
        │   └── AdminPanel.js    # Admin user management
        ├── components/
        │   └── Layout.js        # Sidebar navigation
        ├── App.js
        └── App.css
```
