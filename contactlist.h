#ifndef CONTACTLIST_H
#define CONTACTLIST_H

#include <QDialog>

namespace Ui {
class ContactList;
}

class ContactList : public QDialog
{
    Q_OBJECT

public:
    explicit ContactList(QWidget *parent = 0);
    ~ContactList();

private:
    Ui::ContactList *ui;
};

#endif // CONTACTLIST_H
