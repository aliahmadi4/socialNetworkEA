package edu.mum.ea.socialnetwork.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class TargetedCustomerCriteria {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(length = 6)
    private String gender;
    @Min(value = 18, message = "{AgeMin}")
    private Integer ageMin;
    @Min(value = 18, message = "{AgeMax}")
    private Integer ageMax;
    @Column(length = 20)
    @Size(max = 20, message = "{AdCriteria.City.size}")
    private String city;
    @Column(length = 20)
    @Size(max = 20, message = "{AdCriteria.State.size}")
    private String state;
    @Column(length = 20)
    @Size(max = 20, message = "{AdCriteria.Country.size}")
    private String country;

    public TargetedCustomerCriteria(Integer ageMin, Integer ageMax, String city, String state, String country) {
        this.ageMin = ageMin;
        this.ageMax = ageMax;
        this.city = city;
        this.state = state;
        this.country = country;
    }
}
