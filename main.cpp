#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <src/services/appService.h>
#include <src/MainViewModel.h>
#include <src/constants.h>
#include <src/appUtils.h>

static QObject *appUtilsSingletonProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)
    AppUtils *appUtils = new AppUtils();
    return appUtils;
}

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    qmlRegisterType<MainViewModel>("feedbackapp.backend", 1, 0, "PageMainViewModel");
    qmlRegisterSingletonType<AppUtils>("feedbackapp.static.utils", 1, 0, "AppUtils", appUtilsSingletonProvider);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    Services::AppService appSvc(Constants::FILE_CSV);
    appSvc.init();

    return app.exec();
}



