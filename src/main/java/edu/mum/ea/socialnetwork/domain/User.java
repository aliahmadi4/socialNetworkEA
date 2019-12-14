package edu.mum.ea.socialnetwork.domain;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;

@Getter
@Setter
@NoArgsConstructor
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(unique = true)
    private String username;
    @NotBlank
    private String password;

    private boolean enabled=true;

    @Enumerated(EnumType.STRING)
    private Role role;
    @JsonManagedReference
    @OneToOne(cascade = CascadeType.ALL)
    @Valid
    private Profile profile;
}
