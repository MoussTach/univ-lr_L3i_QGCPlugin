//
// Created by mousstach on 25/06/2021.
//

#pragma once

#include <map>
#include <string>
#include <QList>
#include <QVariant>

class DiveMission_data : public QObject {
    Q_OBJECT
private:
    std::map<std::string, QList<QList<QVariant> > >   diveData;

public:
    explicit DiveMission_data();
    ~DiveMission_data();

    void                    setData(std::string id, QList<QList<QVariant> > data);
    QList<QList<QVariant> > getData(std::string id);
};