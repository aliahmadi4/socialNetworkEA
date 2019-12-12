package edu.mum.ea.socialnetwork.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;

@Data
@NoArgsConstructor
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String username;
    @NotBlank
    private String password;

    private boolean enabled;

    public User(String username, String password){
        this.username = username;
        this.password = password;
    }

    @Enumerated(EnumType.STRING)
    private Role role;

    @OneToOne(cascade = CascadeType.ALL)
    @Valid
    private Profile profile;


//    public void addRole(RoleClass role){
//        roles.add(role);
//    }
//
//    public void removeRole(RoleClass role){
//        roles.remove(role);
//    }


}
