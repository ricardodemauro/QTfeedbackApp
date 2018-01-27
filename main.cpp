#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <src/services/appService.h>
#include <src/MainViewModel.h>
#include <src/constants.h>

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    qmlRegisterType<MainViewModel>("feedbackapp.backend", 1, 0, "PageMainViewModel");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    Services::AppService appSvc(Constants::FILE_CSV);
    appSvc.init();

    return app.exec();
}


