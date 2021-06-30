//
// Created by mousstach on 08/06/2021.
//
#pragma once

#include <QObject>
#include <QAbstractTableModel>
#include <QString>
#include <QList>
#include <QVariant>
#include <string>
#include <array>

class DiveMission_TableModel : public QAbstractTableModel {
    Q_OBJECT
private:

    QList<QList<QVariant> > rowData;

public:
    enum class COLUMNS {
        Instruction = 0,
        Power,
        Unit,
        Factor,
        _,

        NB_COLUMNS
    };
    Q_ENUM(COLUMNS)

public:
    explicit DiveMission_TableModel(QObject* parent = nullptr);
    ~DiveMission_TableModel();

    Q_INVOKABLE int         columnCount(const QModelIndex& parent = QModelIndex()) const override;
    Q_INVOKABLE int         rowCount(const QModelIndex& parent = QModelIndex()) const override;

    QVariant                headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;
    Q_INVOKABLE QVariant    data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
    bool                    setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole) override;
    QList<QList<QVariant> > getData();
    Qt::ItemFlags           flags(const QModelIndex &index) const override;

    Q_INVOKABLE bool        insertRows(int position, int rows, const QModelIndex &index = QModelIndex()) override;
    Q_INVOKABLE bool        removeRows(int position, int rows, const QModelIndex &index = QModelIndex()) override;

    //QHash<int, QByteArray>  roleNames() const override;
};