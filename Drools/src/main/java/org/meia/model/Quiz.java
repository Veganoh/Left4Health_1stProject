package org.meia.model;

import java.util.List;

public class Quiz {
    private List<Question> QuizInitial;
    private List<QuestionCategory> Quiz40;

    public List<Question> getQuizInitial() {
        return QuizInitial;
    }

    public void setQuizInitial(List<Question> quizInitial) {
        QuizInitial = quizInitial;
    }

    public List<QuestionCategory> getQuiz40() {
        return Quiz40;
    }

    public void setQuiz40(List<QuestionCategory> quiz40) {
        Quiz40 = quiz40;
    }

    public String toStringInitial() {
        StringBuilder texto = new StringBuilder("Quiz Initial: \n");
        for (Question question : QuizInitial) {
            texto.append("-ID: ").append(question.getId());
            texto.append("   -Pergunta: ").append(question.getQuestion()).append("\n");
        }

        return texto.toString();
    }

    public String toString40() {
        StringBuilder texto = new StringBuilder("Quiz 40: \n");
        for (QuestionCategory questionCategory : Quiz40) {
            texto.append("Category: ").append(questionCategory.getCategory()).append("\n");
            for (Question question : questionCategory.getCategoryQuestionList()) {
                texto.append("-ID: ").append(question.getId());
                texto.append("   -Pergunta: ").append(question.getQuestion()).append("\n");
            }
        }

        return texto.toString();
    }

    @Override
    public String toString() {
        return "Quiz{\n" +
                " --QuizInitial=\n" + QuizInitial +
                "\n --Quiz40=" + Quiz40 +
                "\n}";
    }
}