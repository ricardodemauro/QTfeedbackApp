#ifndef FEEDBACKVIEWMODEL_H
#define FEEDBACKVIEWMODEL_H

#include <QObject>

class FeedbackViewModel : public QObject
{
    Q_OBJECT
public:
    explicit FeedbackViewModel(QObject *parent = nullptr);

signals:

public slots:
};

#endif // FEEDBACKVIEWMODEL_H