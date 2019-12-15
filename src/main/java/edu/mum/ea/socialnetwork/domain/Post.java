package edu.mum.ea.socialnetwork.domain;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.*;

@Getter
@Setter
@NoArgsConstructor
@Entity
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String text;
    private String photo;
    private String video;

    //    @DateTimeFormat(pattern = "YYYY-MM-dd")
//    private LocalDate creationDate  = LocalDate.now();
    private Date creationDate = new Date();
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate deletionDate;
    private Integer likeCount = 0;
    private Integer commentCount = 0;
    private boolean unhealthy = false;
    private boolean enabled;

    @ManyToOne(cascade = CascadeType.PERSIST)
    private User user;

    @JsonManagedReference
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "post")
    private Set<Likes> likes = new HashSet<Likes>();

    @JsonManagedReference
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "post", fetch = FetchType.EAGER)
    @OrderBy("desc")
    private List<Comments> comments = new ArrayList<Comments>();

    public void addLike(Likes like) {
        likes.add(like);
        this.likeCount++;
    }

    public void removeLike(Likes like) {
        likes.remove(like);
        this.likeCount--;
    }

    public void addComment(Comments comment) {
        comments.add(comment);
        this.commentCount++;
    }
//    public void removeLike(Likes like){
//        likes.remove(like);
//    }
//
//    public void removeLikeCount(){ likeCount--;};
//
//    public void addCommentCount(){ commentCount++;};
//    public void removeCommentCount(){ commentCount--;};

}
