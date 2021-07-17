
package evoting.dto;

import java.util.Objects;

public class CandidateDetails {

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 37 * hash + Objects.hashCode(this.candidateId);
        hash = 37 * hash + Objects.hashCode(this.canididateName);
        hash = 37 * hash + Objects.hashCode(this.party);
        hash = 37 * hash + Objects.hashCode(this.userId);
        hash = 37 * hash + Objects.hashCode(this.city);
        hash = 37 * hash + Objects.hashCode(this.symbol);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final CandidateDetails other = (CandidateDetails) obj;
        if (!Objects.equals(this.candidateId, other.candidateId)) {
            return false;
        }
        if (!Objects.equals(this.canididateName, other.canididateName)) {
            return false;
        }
        if (!Objects.equals(this.party, other.party)) {
            return false;
        }
        if (!Objects.equals(this.userId, other.userId)) {
            return false;
        }
        if (!Objects.equals(this.city, other.city)) {
            return false;
        }
        if (!Objects.equals(this.symbol, other.symbol)) {
            return false;
        }
        return true;
    }
    
    private String candidateId;
    private String canididateName;
    private String party;
    private String userId;
    private String city;
    private String symbol;

    @Override
    public String toString() {
        return "CandidateDetails{" + "candidateId=" + candidateId + ", canididateName=" + canididateName + ", party=" + party + ", userId=" + userId + ", city=" + city + ", symbol=" + symbol + '}';
    }

    public String getCandidateId() {
        return candidateId;
    }

    public void setCandidateId(String candidateId) {
        this.candidateId = candidateId;
    }

    public String getCanididateName() {
        return canididateName;
    }

    public void setCanididateName(String canididateName) {
        this.canididateName = canididateName;
    }

    public String getParty() {
        return party;
    }

    public void setParty(String party) {
        this.party = party;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getSymbol() {
        return symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }

    public CandidateDetails() {
    }
    
        
}
