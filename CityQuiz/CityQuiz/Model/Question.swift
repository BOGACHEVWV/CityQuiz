//
//  Question.swift
//  CityQuiz
//
//  Created by mac on 25.03.2021.
//

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(
                text: "Кокое время года вы предпочитаете?",
                type: .single,
                answers: [
                    Answer(text: "Осень", type: .spb),
                    Answer(text: "Лето", type: .dubai),
                    Answer(text: "Зима", type: .dikson),
                    Answer(text: "Весна", type: .colombo)
                ]
            ),
            Question(
                text: "Какое животное вам больше нравится?",
                type: .multiple,
                answers: [
                    Answer(text: "Кот", type: .spb),
                    Answer(text: "Морской котик", type: .dikson),
                    Answer(text: "Верблюд", type: .dubai),
                    Answer(text: "Попугай", type: .colombo)
                ]
            ),
            Question(
                text: "На сколько вам важно наличие дорогих ресторанов в городе?",
                type: .ranged,
                answers: [
                    Answer(text: "Совсем не ванжо", type: .dikson),
                    Answer(text: "Не важно", type: .colombo),
                    Answer(text: "Важно", type: .spb),
                    Answer(text: "Очень важно", type: .dubai)
                ]
            )
        ]
    }
}
