using {sap.capire.incidents as my} from '../db/schema';

service ProcessorService {
    @odata.draft.enabled
    entity Incidents as projection on my.Incidents;

    @readonly
    entity Customers as projection on my.Customers {
        *,
        firstName || ' ' || lastName as name : String
    };
}

// extend projection ProcessorService.Customers with {
//     firstName || ' ' || lastName as name : String
// }

annotate ProcessorService with @(requires: 'support');
