package edu.mum.ea.socialnetwork.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.FutureOrPresent;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.time.LocalDate;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Advertisement {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank(message = "{Ad.text.empty}")
    @Size(min = 5, max = 255, message = "{Ad.text.size}")
    private String text;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate creationDate = LocalDate.now();
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @FutureOrPresent(message = "{Ad.expiryDate.futureOfPresent}")
    private LocalDate expiryDate;
    private boolean enabled = true;
    @Valid
    @OneToOne
    @JoinColumn(name = "advertisementId")
    private TargetedCustomerCriteria targetedCustomerCriteria;

    public Advertisement(String text, LocalDate creationDate, LocalDate expiryDate) {
        this.text = text;
        this.creationDate = creationDate;
        this.expiryDate = expiryDate;
    }
}
