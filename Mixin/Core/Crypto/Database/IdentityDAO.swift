import Foundation
import WCDBSwift

class IdentityDao: SignalDAO {

    static let shared = IdentityDao()

    func getLocalIdentity() -> Identity? {
        return SignalDatabase.shared.getCodable(condition: Identity.Properties.address == "-1")
    }

    func getIdentity(address: String) -> Identity? {
        return SignalDatabase.shared.getCodable(condition: Identity.Properties.address == address)
    }

    func deleteIdentity(address: String) {
        SignalDatabase.shared.delete(table: Identity.tableName, condition: Identity.Properties.address == address)
    }

}
