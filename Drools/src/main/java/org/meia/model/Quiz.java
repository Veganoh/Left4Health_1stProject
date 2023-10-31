package org.meia.model;

import org.meia.anxietyDiagnosis.Reader;

import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
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

    public Quiz() throws FileNotFoundException {
        this.fillQuestions();
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

    public String generateInitialQuizString(){
        StringBuilder sb = new StringBuilder();
        for(Question q : this.QuizInitial){
            sb.append(q.getId()).append("\n");
            sb.append(q.getQuestion()).append("\n");
        }
        return sb.toString();
    }

    public String generateQuiz40String(){
        List<Question> quiz40 = getRandomizedQuiz40();

        StringBuilder sb = new StringBuilder();
        for(Question q : quiz40){
            sb.append(q.getId()).append("\n");
            sb.append(q.getQuestion()).append("\n");
        }
        return sb.toString();
    }
    private List<Question> getRandomizedQuiz40(){
        List<Question> res = new ArrayList<>(Quiz40);
        Collections.shuffle(res);

        return res;
    }
}