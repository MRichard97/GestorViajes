import app from './app';

app.listen(app.get('port'), () => {
    console.log('Server is on port', app.get('port'));
});