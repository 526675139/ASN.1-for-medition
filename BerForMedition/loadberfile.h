#ifndef LOADBERFILE_H
#define LOADBERFILE_H

#include <QObject>

class LoadBerFile : public QObject
{
    Q_OBJECT

    //注册属性到元对象系统，使之可以在QML中访问
    //Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged)

public:
    explicit LoadBerFile(QObject *parent = nullptr);
    Q_INVOKABLE void readFile(QString fileUrl);

signals:
    void finishLoadFile(QString );

public slots:
    void receiveReadFileReq(QString);

};

#endif // LOADBERFILE_H
