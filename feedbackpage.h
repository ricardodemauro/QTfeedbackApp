#ifndef FEEDBACKPAGE_H
#define FEEDBACKPAGE_H

#include <QObject>

class FeedbackPage : public QObject
{
    Q_OBJECT
public:
    explicit FeedbackPage(QObject *parent = nullptr);

signals:

public slots:
};

#endif // FEEDBACKPAGE_H