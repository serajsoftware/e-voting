
package evoting.dto;

import java.util.Objects;

/**
 *
 * @author Keshri
 */
public class Candidatepojo {

    public Candidatepojo() {
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 71 * hash + Objects.hashCode(this.party);
        hash = 71 * hash + Objects.hashCode(this.symbol);
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
        final Candidatepojo other = (Candidatepojo) obj;
        if (!Objects.equals(this.party, other.party)) {
            return false;
        }
        if (!Objects.equals(this.symbol, other.symbol)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Candidatepojo{" + "party=" + party + ", symbol=" + symbol + '}';
    }

    public String getParty() {
        return party;
    }

    public void setParty(String party) {
        this.party = party;
    }

    public String getSymbol() {
        return symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }

    public Candidatepojo(String party, String symbol) {
        this.party = party;
        this.symbol = symbol;
    }
    private String party;
    private String symbol;
}
