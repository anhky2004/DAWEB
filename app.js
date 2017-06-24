var express = require('express'),
    session = require('express-session'),
    handlebars = require('express-handlebars'),
    handlebars_sections = require('express-handlebars-sections'),
    MySQLStore = require('express-mysql-session')(session),
    favicon = require('serve-favicon'),
    bodyParser = require('body-parser'),
    morgan = require('morgan'),
    path = require('path'),
    wnumb = require('wnumb'),
    morgan = require('morgan'),
    mustache = require('mustache'),
    moment = require('moment'),
    wnumb = require('wnumb'),
    handleLayout = require('./middle-wares/handleLayout'),
    handle404 = require('./middle-wares/handle-404'),
    homeController = require('./controllers/homeController'),
    categoryController = require('./controllers/categoryController'),
    productController = require('./controllers/productController');
    accountController = require('./controllers/accountController');
    var layoutRoute = require('./controllers/_layoutRoute');

var app = express();

app.use(morgan('dev'));

app.engine('hbs', handlebars({
    extname: 'hbs',
    defaultLayout: 'main',
    layoutsDir: 'views/_layouts/',
    partialsDir: 'views/_partials/',
    helpers: {
        section: handlebars_sections(),
        number_format: function (n) {
            var nf = wnumb({
                thousand: ','
            });
            return nf.to(n);
        }
    }
}));
app.set('view engine', 'hbs');

app.use(express.static(
    path.resolve(__dirname, 'public')
));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));

app.use(session({
    secret: 'Z7X7gXzoKBT8h18jwXBEP4T0kJ8=',
    resave: false,
    saveUninitialized: true,
    // store: new fileStore()
    store: new MySQLStore({
        host: '127.0.0.1',
        port: 3306,
        user: 'root',
        password: '',
        database: 'qlbh',
        createDatabaseTable: true,
        schema: {
            tableName: 'sessions',
            columnNames: {
                session_id: 'session_id',
                expires: 'expires',
                data: 'data'
            }
        }
    }),
}));
app.use(layoutRoute);
app.use(handleLayout);
app.use('/', homeController);
app.use('/category', categoryController);
app.use('/product', productController);
app.use('/account', accountController);
app.use(handle404);

app.listen(3002);