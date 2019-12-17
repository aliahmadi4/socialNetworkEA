package edu.mum.ea.socialnetwork.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@Entity
public class Likes {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

//    @JsonBackReference
    @JsonManagedReference
    @ManyToOne
    private User user;

    @JsonBackReference
    @ManyToOne(cascade = CascadeType.PERSIST)
    private Post post;

    public void addPost(Post p) {
        this.setPost(p);
        p.addLike(this);
    }
}
