//
// Created by mousstach on 08/06/2021.
//
#ifndef FILEIO_H
#define FILEIO_H

#pragma once

#include <QObject>
#include <QFile>
#include <QTextStream>

class FileIO : public QObject
{
    Q_OBJECT
public slots:
    const QString   read(const QString &source) {
        QString data;

        if (source.isEmpty())
            return data;

        QFile inputFile(source);
        if (inputFile.open(QIODevice::ReadOnly)) {

            QTextStream in(&inputFile);
            while (!in.atEnd()) {
                QString line = in.readLine();
                data.append(line);
            }

            inputFile.close();
        }
        return data;
    }

    bool write(const QString &source, const QString &data) {
        if (source.isEmpty())
            return false;

        QFile file(source);
        if (!file.open(QFile::WriteOnly | QFile::Truncate))
            return false;

        QTextStream out(&file);
        out << data;
        file.close();
        return true;
    }

public:
    FileIO() {}
};

#endif // FILEIO_H