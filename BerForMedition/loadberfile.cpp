#include "loadberfile.h"
#include <QDebug>

LoadBerFile::LoadBerFile(QObject *parent) : QObject(parent)
{

}

/*
 * 读取文件内容，并依据BER协议解析到内存
 *  由QML调用
 */
void LoadBerFile::readFile(QString fileUrl)
{
    qDebug()<<fileUrl;
    emit finishLoadFile(fileUrl);
}

void LoadBerFile::receiveReadFileReq(QString value)
{
    qDebug()<<"receiveReadFileReq:"<<value;

    emit finishLoadFile(value);
}
