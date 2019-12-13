package edu.mum.ea.socialnetwork.domain;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@Entity
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String text;
    private String photo;
    private String video;

//    @DateTimeFormat(pattern = "YYYY-MM-dd")
//    private LocalDate creationDate  = LocalDate.now();
    private Date creationDate  = new Date();
    private LocalDate deletionDate;
    private Integer likeCount = 0;
    private Integer commentCount = 0;
    private boolean enabled;

    @ManyToOne(cascade = CascadeType.PERSIST)
    private User user;

    @JsonManagedReference
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "post")
    private List<Likes> likes = new ArrayList<Likes>();

    @JsonManagedReference
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "post", fetch = FetchType.EAGER)
    @OrderBy("desc")
    private List<Comments> comments = new ArrayList<Comments>();

    public void addLike(Likes like){ likes.add(like); this.likeCount++;}
    public void addComment(Comments comment){ comments.add(comment); this.commentCount++;}
//    public void removeLike(Likes like){
//        likes.remove(like);
//    }
//
//    public void removeLikeCount(){ likeCount--;};
//
//    public void addCommentCount(){ commentCount++;};
//    public void removeCommentCount(){ commentCount--;};

}
