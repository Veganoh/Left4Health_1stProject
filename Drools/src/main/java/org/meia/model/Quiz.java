package org.meia.model;

import org.meia.anxietyDiagnosis.Reader;

import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;


public class Quiz {
    private final List<Question> QuizInitial = new ArrayList<>();
    private final List<Question> Quiz40 = new ArrayList<>();

    private String teste;
    private String teste2;
    public  int GENERAL_ANXIETY_SCORE = 0;
    public  int PANIC_SYNDROME_SCORE = 0;
    public  int PANIC_AGORAPHOBIA_SYNDROME_SCORE = 0;
    public  int AGORAPHOBIA_SYNDROME_SCORE = 0;
    public  int SPECIFIC_PHOBIA_SCORE = 0;
    public  int SELECTIVE_MUTISM_SCORE = 0;
    public  int SEPARATION_ANXIETY_SCORE = 0;
    public  int SOCIAL_PHOBIA_SCORE = 0;



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
                    updateCategoryScores(question.getQuestionType(),answer);
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

    private void updateCategoryScores(String  questionType, String answer) {
        switch (questionType) {
            case QuestionType.GENERAL_ANXIETY:
                GENERAL_ANXIETY_SCORE += calculateScore(answer);
                break;
            case  QuestionType.PANIC_SYNDROME:
                PANIC_SYNDROME_SCORE += calculateScore(answer);
                break;
            case QuestionType.PANIC_AGORAPHOBIA_SYNDROME:
                PANIC_AGORAPHOBIA_SYNDROME_SCORE += calculateScore(answer);
                break;
            case QuestionType.AGORAPHOBIA_SYNDROME:
                AGORAPHOBIA_SYNDROME_SCORE += calculateScore(answer);
                break;
            case QuestionType.SPECIFIC_PHOBIA:
                SPECIFIC_PHOBIA_SCORE += calculateScore(answer);
                break;
            case QuestionType.SELECTIVE_MUTISM:
                SELECTIVE_MUTISM_SCORE += calculateScore(answer);
                break;
            case QuestionType.SEPARATION_ANXIETY:
                SEPARATION_ANXIETY_SCORE += calculateScore(answer);
                break;
            case QuestionType.SOCIAL_PHOBIA:
                SOCIAL_PHOBIA_SCORE += calculateScore(answer);
                break;
            default:
        }
    }
    private int calculateScore(String answer) {
        return Integer.parseInt(answer);
    }

    public String getTeste() {
        return teste;
    }

    public void setTeste(String teste) {
        this.teste = teste;
    }

    public String getTeste2() {
        return teste2;
    }

    public void setTeste2(String teste2) {
        this.teste2 = teste2;
    }
}