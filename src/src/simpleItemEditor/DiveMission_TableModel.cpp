//
// Created by mousstach on 08/06/2021.
//
#include <QDebug>
#include "DiveMission_TableModel.h"

//--- Constructor ---
DiveMission_TableModel::DiveMission_TableModel(QObject* parent) : QAbstractTableModel(parent) {
    qDebug() << "DiveMission_TableModel CALLED";

    int rows = 3;
    for (int row = 0; row < rows; row++) {
        QList<QVariant> emptyRow;

        for (int i = 0; i < columnCount(QModelIndex()); i++)
            emptyRow.append(QString("test %1").arg(i));

        rowData.append(emptyRow);
    }
}

DiveMission_TableModel::~DiveMission_TableModel() {
    foreach (auto row, rowData)
        row.clear();
    rowData.clear();
}

//--- Public ---
int DiveMission_TableModel::columnCount(const QModelIndex &parent) const {
    if (parent.isValid())
        return 0;

    return static_cast<int>(COLUMNS::NB_COLUMNS);
}

int DiveMission_TableModel::rowCount(const QModelIndex &parent) const {
    if (parent.isValid())
        return 0;

    return rowData.size();
}

QVariant DiveMission_TableModel::headerData(int section, Qt::Orientation orientation, int role) const {
    if (role != Qt::DisplayRole)
        return QVariant();

    if (orientation != Qt::Horizontal)
        return QVariant();

    if (section >= static_cast<int>(COLUMNS::NB_COLUMNS))
        return QVariant();

    return QVariant::fromValue(static_cast<COLUMNS>(section));
    /*
    if (role == Qt::DisplayRole && orientation == Qt::Horizontal) {
        switch (section) {
            case 0:
                return QString("Instruction");
            case 1:
                return QString("Power");
            case 2:
                return QString("Unit");
            case 3:
                return QString(Factor");
        }
    }
    return QVariant();*/
}

QVariant DiveMission_TableModel::data(const QModelIndex &index, int role) const {
    if (role != Qt::DisplayRole)
        return QVariant();

    if (!index.isValid())
        return QVariant();

    // check the row
    if ((index.row() >= rowData.length()) || (index.row() < 0))
        return QVariant();

    // check the column
    if ((index.row() >= rowData[index.row()].length()) || (index.column() < 0))
        return QVariant();

    return rowData[index.row()][index.column()];

/*
    if (role == Qt::DisplayRole) {
        if (index.column() == 0)
            return rowData.at(index.row()).instrucData;
        else if (index.column() == 1)
            return rowData.at(index.row()).powerData;
        else if (index.column() == 2)
            return rowData.at(index.row()).unitData;
        else if (index.column() == 3)
            return rowData.at(index.row()).factorData;
    }
    return QVariant();*/
}

bool DiveMission_TableModel::setData(const QModelIndex &index, const QVariant &value, int role) {
    qDebug() << "setData CALLED: " << value << " | index : " << index;

    if (!index.isValid() || (role != Qt::EditRole))
        return false;

    qDebug() << "\tpass 1";

    // check the row
    if ((index.row() >= rowData.length()) || (index.row() < 0))
        return false;

    qDebug() << "\tpass 2";

    // check the column
    if ((index.row() >= rowData[index.row()].length()) || (index.column() < 0))
        return false;

    qDebug() << "\tchange text";

    rowData[index.row()][index.column()] = value;
    emit dataChanged(index, index, {role});

    return true;
}

QList<QList<QVariant> > DiveMission_TableModel::getData() {
    return rowData;
}

Qt::ItemFlags   DiveMission_TableModel::flags(const QModelIndex &index) const {
    Qt::ItemFlags   flags = Qt::ItemIsEnabled;

    if (index.isValid()) {
        if (static_cast<COLUMNS>(index.column()) == COLUMNS::Instruction)
            flags |= Qt::ItemIsEditable;
        if (static_cast<COLUMNS>(index.column()) == COLUMNS::Power)
            flags |= Qt::ItemIsEditable;
        if (static_cast<COLUMNS>(index.column()) == COLUMNS::Unit)
            flags |= Qt::ItemIsEditable;
        if (static_cast<COLUMNS>(index.column()) == COLUMNS::Factor)
            flags |= Qt::ItemIsEditable;
    }

    return flags;
}


bool DiveMission_TableModel::insertRows(int position, int rows, const QModelIndex &index) {
    Q_UNUSED(index);
    qDebug() << "insertRows CALLED " << rowCount(QModelIndex()) << " | pos " << position;

    if ((position > rowCount(QModelIndex())) || (position < 0))
        return false;

    qDebug() << "\t begin";
    beginInsertRows(QModelIndex(), position, position + rows - 1);
    for (int row = 0; row < rows; row++) {
        QList<QVariant> emptyRow;

        for (int i = 0; i < columnCount(QModelIndex()); i++)
            emptyRow.append(QVariant(""));

        qDebug() << "\t\t insert row" << position;
        rowData.insert(position, emptyRow);
    }

    qDebug() << "\t end";
    endInsertRows();

    return true;
}

bool DiveMission_TableModel::removeRows(int position, int rows, const QModelIndex &index) {
    Q_UNUSED(index);

    qDebug() << "removeRows CALLED";
    if ((position > rowCount(QModelIndex())) || (position < 0) || (rowCount(QModelIndex()) <= 1))
        return false;

    if (rows > rowCount(QModelIndex()))
        return false;

    qDebug() << "\t begin";
    beginRemoveRows(QModelIndex(), position, position + rows - 1);
    for (int row = 0; row < rows; row++) {
        qDebug() << "\t\t delete row " << position;
        rowData.removeAt(position);
    }

    qDebug() << "\t end";
    endRemoveRows();
    return true;
}

/*
QHash<int, QByteArray> DiveMission_TableModel::roleNames() const {
    return { { Qt::DisplayRole, "display" } };
}*/
