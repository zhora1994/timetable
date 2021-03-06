# Functional Requirement Specifications

## Общее описание

Система для осуществляния управления спортивными объектами. 
В рамках задач системы необходимо решить следующие проблемы:
- управление расписанием работы спортивного зала;
- возможность просмотра и бронирования временных интервалов для проведения тренировки.

## Пользовательские сценарии

Этап 1

- Ручное формирование расписания бронирования столов;
- Запрос актуального расписания (слоты независимо от стола);
- Запрос актиального расписания для конкретного стола.
- Определение рабочих и нерабочих дней;

Этап 2

- Авторизация у бота;
- Бронирование тайм слота;
- Отмена бронирования.

## Общие требования "Этап 1"

Необходимо создание структуры базы данных, наполнение справочников.
После заполнения справочников необходимо подготовить скрипт для инициализации расписания на месяц вперёд. 
Необходимо подготовить скрипт дня обновления расписания (продление доступного расписания на 1 день в конце каждого дня),  после реализации скрипта он должен быть установлен на ежедневное выполнение в определённый период времени.

Необходимо иметь возможность определения нерабочих дней для блокирования возможности наполнения и бронирования данных дней



## Ограничения

| Наименование                   | Значение |
| :----------------------------- | -------: |
| Максимальное количество столов |       30 |
| Минимальное количество столов  |        1 |