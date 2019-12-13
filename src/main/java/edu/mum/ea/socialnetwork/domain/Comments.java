package edu.mum.ea.socialnetwork.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@Entity
public class Comments {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotEmpty
    private String text;

    @Transient
    private String postId;

    @DateTimeFormat(pattern = "YYYY-MM-dd")
    private LocalDate creationDate = LocalDate.now();

    @JsonBackReference
    @ManyToOne
    private User user;

    @JsonBackReference
    @ManyToOne(cascade = CascadeType.PERSIST)
    private Post post;

    public void addPost(Post p) {
        this.setPost(p);
        p.addComment(this);
    }
}
