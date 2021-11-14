import { app, BrowserWindow } from 'electron'
import serve  from 'electron-serve'
import { resolve } from 'path'

# Serve imba app
const loadURL = serve {directory: resolve process.cwd() , '.dev', 'public'}


try # hmr
	require('electron-reloader')(module)

def createWindow
	
	const win\BrowserWindow = new BrowserWindow {
		width: 1280,
		height: 720,
		webPreferences: {
			preload:  resolve __dirname , '_preload.js'
		}
	}

	await loadURL(win);


app.whenReady().then do()
	createWindow!

	console.log(preload.absPath)
	app.on 'activate', do 
		if BrowserWindow.getAllWindows().length === 0
			createWindow!



app.on 'window-all-closed', do
	if process.platform !== 'darwin' 
		app.quit!
