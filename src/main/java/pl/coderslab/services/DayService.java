package pl.coderslab.services;

import java.util.List;

public interface DayService<D> {
    List<D> findAllDays();
}
