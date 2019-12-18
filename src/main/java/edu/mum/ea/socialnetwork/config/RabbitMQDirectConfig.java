package edu.mum.ea.socialnetwork.config;

import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.amqp.rabbit.listener.MessageListenerContainer;
import org.springframework.amqp.rabbit.listener.SimpleMessageListenerContainer;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.amqp.support.converter.MessageConverter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RabbitMQDirectConfig {

    public final static String QUEUE = "adminQueue";
    public final static String EXCHANGE = "direct-exchange";
    public final static String ROUTING_KEY = "admin";

//    @Bean
//    Queue marketingQueue() {
//        return new Queue("marketingQueue", false);
//    }
//
//    @Bean
//    Queue financeQueue() {
//        return new Queue("financeQueue", false);
//    }

    @Bean
    Queue adminQueue() {
        return new Queue(QUEUE, false);
    }

    @Bean
    public DirectExchange exchange() {
        return new DirectExchange(EXCHANGE);
    }

//    @Bean
//    Binding marketingBinding(Queue marketingQueue, DirectExchange exchange) {
//        return BindingBuilder.bind(marketingQueue).to(exchange).with("marketing");
//    }
//
//    @Bean
//    Binding financeBinding(Queue financeQueue, DirectExchange exchange) {
//        return BindingBuilder.bind(financeQueue).to(exchange).with("finance");
//    }

    @Bean
    Binding adminBinding(Queue adminQueue, DirectExchange exchange) {
        return BindingBuilder.bind(adminQueue).to(exchange).with(ROUTING_KEY);
    }
}
