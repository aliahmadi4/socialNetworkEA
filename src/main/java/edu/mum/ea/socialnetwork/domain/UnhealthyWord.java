package edu.mum.ea.socialnetwork.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class UnhealthyWord {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(length =30)
    @NotBlank(message = "{Word.blank}")
    @Size(min = 3, max = 30, message = "{Word.size}")
    private String word;

    public UnhealthyWord(String word) {
        this.word = word;
    }
}
