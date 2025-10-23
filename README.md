# Verdaccio Registry on Railway

This repository contains configuration for deploying a private npm registry Verdaccio on Railway platform with persistent data storage.

## 🚀 Features

- **Private npm registry** with authentication support ✅
- **Persistent storage** data using Railway volumes ✅
- **Automatic deployment** from GitHub ✅
- **Proxying** to official npm registry ✅
- **Web interface** for package management ✅

## 📁 Project Structure

```
├── Dockerfile          # Docker image for Verdaccio
├── docker-compose.yml  # Local development
├── config.yaml         # Verdaccio configuration
├── railway.json        # Railway configuration
├── .gitignore         # Ignored files
└── README.md          # Documentation
```

## 🛠 Local Development

### Requirements

- Docker
- Docker Compose

### Running

1. Clone the repository:
```bash
git clone <your-repo-url>
cd verdaccio
```

2. Run with Docker Compose:
```bash
docker-compose up -d
```

3. Open browser and go to: http://localhost:4873

### Stopping

```bash
docker-compose down
```

## 🚀 Deployment on Railway

### Preparation

1. Create an account on [Railway](https://railway.app)
2. Connect your GitHub account
3. Make sure the repository is in your GitHub

### Deployment

1. **Create a new project on Railway:**
   - Go to [Railway Dashboard](https://railway.app/dashboard)
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Choose your repository

2. **Configure environment variables (optional):**
   - `VERDACCIO_PORT=4873` (default)

3. **Set up Volume for data:**
   - In Railway project settings
   - Go to "Volumes" section
   - Create volume with path `/verdaccio/storage`
   - This ensures data persistence during redeployment

4. **Deploy:**
   - Railway will automatically detect `railway.json` and `Dockerfile`
   - Build and deployment process will start
   - After completion you'll get your registry URL

### Setting up Volume on Railway

For persistent data storage:

1. In Railway dashboard go to your project
2. Open "Volumes" tab
3. Create a new volume:
   - **Name**: `verdaccio-storage`
   - **Mount Path**: `/verdaccio/storage`
   - **Size**: Choose appropriate size (minimum 1GB)

## ✅ Deployment Status

**Application successfully deployed and ready to use!**

- ✅ Verdaccio is running and working
- ✅ Authentication configured (users saved in volume)
- ✅ Proxying to npmjs.org works
- ✅ Persistent data storage configured
- ✅ Dark theme enabled
- ✅ npm packages available to all (public registry)
- ✅ Web interface disabled (API only)

## 📦 Using the Registry

### Setting up npm to use your registry

```bash
# Set registry as default
npm config set registry https://your-railway-app.railway.app

# Or use for specific scope
npm config set @your-scope:registry https://your-railway-app.railway.app
```

### User registration

```bash
npm adduser --registry https://your-railway-app.railway.app
```

### Publishing packages

```bash
npm publish --registry https://your-railway-app.railway.app
```

### Installing packages

```bash
npm install package-name --registry https://your-railway-app.railway.app
```

## ⚙️ Configuration

### Main settings in `config.yaml`:

- **Authentication**: Required for package publishing
- **Proxying**: Automatic proxying to npmjs.org
- **Scoped packages**: Support for @scope/package-name
- **Logging**: Configured for Railway

### Package access settings:

- `@*/*` - Scoped packages require authentication
- `**` - Other packages available to all, but publishing requires authentication

## 🔧 Monitoring and Logs

### Viewing logs on Railway:

1. Go to your project on Railway
2. Open "Deployments" tab
3. Select the latest deployment
4. View logs in real-time

### Health Check:

Railway automatically checks service availability at `/` path

## 🛡 Security

### Recommendations:

1. **Use HTTPS** (Railway provides automatically)
2. **Configure authentication** for package publishing
3. **Regularly update** Verdaccio to latest version
4. **Monitor logs** for suspicious activity

## 🔄 Updates

### Updating Verdaccio:

1. Update version in `Dockerfile`
2. Commit changes to Git
3. Railway will automatically rebuild and deploy the update

### Backup:

Data is stored in Railway Volume, but it's recommended to:
1. Regularly export important packages
2. Set up automatic backup

## 🆘 Troubleshooting

### Common issues:

1. **Service not starting:**
   - Check logs in Railway Dashboard
   - Make sure port 4873 is available

2. **Data not persisting:**
   - Check Volume configuration in Railway
   - Make sure `/verdaccio/storage` path is properly mounted

3. **Authentication issues:**
   - Check configuration in `config.yaml`
   - Make sure user is registered

### Logs for diagnostics:

```bash
# Locally
docker-compose logs verdaccio

# On Railway - through Dashboard
```

## 📚 Additional Resources

- [Verdaccio Documentation](https://verdaccio.org/docs/en/installation)
- [Railway Documentation](https://docs.railway.app)
- [npm Registry Documentation](https://docs.npmjs.com/)

## 📄 License

MIT License

---

**Note**: This repository is configured for deployment on Railway. Additional configuration may be required for other platforms.
