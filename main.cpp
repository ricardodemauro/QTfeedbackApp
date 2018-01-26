#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <src/pagemainViewModel.h>
#include <src/pageServiceViewModel.h>

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    qmlRegisterType<PageMainViewModel>("feedbackapp.backend", 1, 0, "PageMainViewModel");
    qmlRegisterType<PageServiceViewModel>("feedbackapp.backend", 1, 0, "PageServiceViewModel");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}


