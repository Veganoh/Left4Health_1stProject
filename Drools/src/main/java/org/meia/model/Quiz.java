package org.meia.model;

import org.meia.anxietyDiagnosis.Reader;

import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;


public class Quiz {
    private final List<Question> QuizInitial = new ArrayList<>();
    private final List<Question> Quiz40 = new ArrayList<>();


    public List<Question> getQuizInitial() {
        return QuizInitial;
    }

    public List<Question> getQuiz40() {
        return Quiz40;
    }

    public Quiz(){
    }

    public void fillQuestions() throws FileNotFoundException {
        Reader.readQuestionsFromFile(this);
    }

    public void addQuestionInitial(Question q){
        this.QuizInitial.add(q);
    }

    public void addQuestion40(Question q){
        this.Quiz40.add(q);
    }

    public void addAnswerToQuestion(int id, String answer){
        if (id >= 1 && id <= 40) {
            for (Question question : Quiz40) {
                if (question.getId() == id) {
                    question.setAnswer(answer);
                }
            }
        } else {
            for (Question question : QuizInitial) {
                if (question.getId() == id) {
                     question.setAnswer(answer);
                }
            }
        }
    }

    @Override
    public String toString() {
        return "Quiz{\n" +
                " --QuizInitial=" + QuizInitial +
                "\n --Quiz40=" + Quiz40 +
                "\n}";
    }
}