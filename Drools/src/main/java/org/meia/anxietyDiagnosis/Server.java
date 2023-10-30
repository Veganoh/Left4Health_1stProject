package org.meia.anxietyDiagnosis;

import java.io.IOException;
import java.io.OutputStream;

import com.sun.net.httpserver.HttpServer;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpExchange;
import java.net.InetSocketAddress;

import java.util.List;

import org.meia.model.Question;
import org.meia.model.Quiz;


public class Server {

    private static final int serverPort = 8080;

    private static Quiz quiz;

    public static void main(String[] args) throws IOException {
        quiz = new Quiz();
        HttpServer server = HttpServer.create(new InetSocketAddress(serverPort), 0);
        server.createContext("/api/drools", new HelloHandler());
        server.createContext("/api/quiz", new ObtainQuiz());
        server.setExecutor(null);
        server.start();
        System.out.println("Servidor Drools a rodar na porta " + serverPort);
    }

    static class ObtainQuiz implements HttpHandler {
        @Override
        public void handle(HttpExchange t) throws IOException {
            String response = quiz.generateQuizString();
            t.sendResponseHeaders(200, response.length());
            OutputStream os = t.getResponseBody();
            os.write(response.getBytes());
            os.close();        }
    }

    static class HelloHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange t) throws IOException {
            String response = "This is the response";
            long threadId = Thread.currentThread().getId();
            System.out.println("I am thread " + threadId );
            response = response + "Thread Id = "+threadId;
            t.sendResponseHeaders(200, response.length());
            OutputStream os = t.getResponseBody();
            os.write(response.getBytes());
            os.close();
        }
    }
}
