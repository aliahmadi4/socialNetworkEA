package edu.mum.ea.socialnetwork.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.util.List;

@Data
@NoArgsConstructor
@Entity
@SecondaryTable(name = "profile")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank
    private String userName;
    @NotBlank
    private String password;

    private boolean enabled;

    @NotBlank
    @Column(table = "profile")
    private String gender;

    @Email
    @Column(table = "profile")
    private String email;

    @NotBlank
    @Column(table = "profile")
    private String firstName;

    @NotBlank
    @Column(table = "profile")
    private String lastName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @NotNull
    @Column(table = "profile")
    private LocalDate dateOfBirth;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(table = "profile")
    private LocalDate joinDate;


    @OneToMany(cascade = CascadeType.ALL)
    private List<Role> roles;

    public void addRole(Role role){
        roles.add(role);
    }

    public void removeRole(Role role){
        roles.remove(role);
    }


}
