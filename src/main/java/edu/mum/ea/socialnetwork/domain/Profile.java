package edu.mum.ea.socialnetwork.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@Entity
public class Profile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    private String gender;  //values: Male & Female

    @NotBlank
    @Email
    private String email;

    @NotBlank
    private String firstName;

    @NotBlank
    private String lastName;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @NotNull
    @Past
    private LocalDate dateOfBirth;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate joinDate;

    private Integer noOfUnhealthyPosts = 0;

    @OneToOne(mappedBy = "profile")
    private User user;

    @OneToOne(cascade = CascadeType.ALL)
    private Address address;


    private String profilePhoto;

    @Size(min = 3, max = 30)
    private String occupation;








    public Profile(@NotNull String gender, @NotBlank @Email String email, @NotBlank String firstName,
                   @NotBlank String lastName, @NotNull @Past LocalDate dateOfBirth, LocalDate joinDate) {
        this.gender = gender;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.dateOfBirth = dateOfBirth;
        this.joinDate = joinDate;
    }
}
