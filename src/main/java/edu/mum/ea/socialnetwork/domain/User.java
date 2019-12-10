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
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank
    private String userName;
    @NotBlank
    private String password;

    private boolean enabled;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Role> roles;

    @OneToOne(cascade = CascadeType.ALL)
    private Profile profile;

    public void addRole(Role role){
        roles.add(role);
    }

    public void removeRole(Role role){
        roles.remove(role);
    }


}
