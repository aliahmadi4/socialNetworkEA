package edu.mum.ea.socialnetwork.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@AllArgsConstructor
public class Messages implements Serializable {
    private String exchangeName;
    private String routingKey;
    private String messageData;
}
