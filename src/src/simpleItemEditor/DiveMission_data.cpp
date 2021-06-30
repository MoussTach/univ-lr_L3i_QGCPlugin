//
// Created by mousstach on 25/06/2021.
//

#include <iostream>

#include <QDebug>
#include "DiveMission_data.h"

//--- Constructor ---
DiveMission_data::DiveMission_data() {
}

DiveMission_data::~DiveMission_data() {
    std::map<std::string, QList<QList<QVariant> > >::iterator it = this->diveData.begin();

    while (it != this->diveData.end()) {
        for(int i = 0; i < it->second.count(); ++i) {

            qDebug() << "\t --";
            for(int j = 0; j < it->second[i].count(); ++j) {

                qDebug() << "\t\t> " << it->second[i][j];
            }
        }

        it++;
    }
}

//--- Public ---
void DiveMission_data::setData(std::string id, QList<QList<QVariant> > data) {
    if (!this->diveData.insert(std::make_pair(id, data)).second) {
        this->diveData[id] = data;
    }
}

QList<QList<QVariant> > DiveMission_data::getData(std::string id) {
    std::map<std::string, QList<QList<QVariant> > >::const_iterator pos = this->diveData.find(id);

    if (pos == this->diveData.end()) {
        return {};
    } else {
        return pos->second;
    }
}