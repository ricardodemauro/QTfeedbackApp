#ifndef SERVICEVIEWMODEL_H
#define SERVICEVIEWMODEL_H

#include <QObject>
#include <src/pageViewModelBase.h>

class PageServiceViewModel : 
	public QObject,
    public PageViewModelBase
{
    Q_OBJECT

    Q_PROPERTY(int selectedFeedback READ selectedFeedback WRITE setSelectedFeedback NOTIFY selectedFeedbackChanged)

    Q_PROPERTY(QString questionText READ questionText NOTIFY questionTextChanged)
public:
    explicit PageServiceViewModel(QObject *parent = nullptr);

    Q_INVOKABLE void startClickHandler();
    Q_INVOKABLE void quitClickHandler();

    void setSelectedFeedback(int &feedback);
    int selectedFeedback();

    QString questionText();

signals:
    void selectedFeedbackChanged();
    void questionTextChanged();

private:
    int m_selectedFeedback;
    QString m_questionText;
};

#endif // SERVICEVIEWMODEL_H
