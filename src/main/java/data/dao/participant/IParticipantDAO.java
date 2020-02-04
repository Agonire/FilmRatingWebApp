package data.dao.participant;

import data.hibernate.entity.Participant;

import java.util.List;

public interface IParticipantDAO {
    List<Participant> getParticipants();
    void createParticipant(Participant participant);
    void removeParticipant(Participant participant);
}
