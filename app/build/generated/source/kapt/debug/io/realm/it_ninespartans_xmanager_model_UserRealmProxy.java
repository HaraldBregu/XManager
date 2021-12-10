package io.realm;


import android.annotation.TargetApi;
import android.os.Build;
import android.util.JsonReader;
import android.util.JsonToken;
import io.realm.ImportFlag;
import io.realm.ProxyUtils;
import io.realm.exceptions.RealmMigrationNeededException;
import io.realm.internal.ColumnInfo;
import io.realm.internal.NativeContext;
import io.realm.internal.OsList;
import io.realm.internal.OsMap;
import io.realm.internal.OsObject;
import io.realm.internal.OsObjectSchemaInfo;
import io.realm.internal.OsSchemaInfo;
import io.realm.internal.OsSet;
import io.realm.internal.Property;
import io.realm.internal.RealmObjectProxy;
import io.realm.internal.Row;
import io.realm.internal.Table;
import io.realm.internal.android.JsonUtils;
import io.realm.internal.core.NativeRealmAny;
import io.realm.internal.objectstore.OsObjectBuilder;
import io.realm.log.RealmLog;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@SuppressWarnings("all")
public class it_ninespartans_xmanager_model_UserRealmProxy extends it.ninespartans.xmanager.model.User
    implements RealmObjectProxy, it_ninespartans_xmanager_model_UserRealmProxyInterface {

    static final class UserColumnInfo extends ColumnInfo {
        long idColKey;
        long accountColKey;
        long fullnameColKey;
        long headlineColKey;
        long roleColKey;
        long ageColKey;
        long emailAddressColKey;
        long phoneNumberColKey;
        long createdAtColKey;
        long updatedAtColKey;

        UserColumnInfo(OsSchemaInfo schemaInfo) {
            super(10);
            OsObjectSchemaInfo objectSchemaInfo = schemaInfo.getObjectSchemaInfo("User");
            this.idColKey = addColumnDetails("id", "id", objectSchemaInfo);
            this.accountColKey = addColumnDetails("account", "account", objectSchemaInfo);
            this.fullnameColKey = addColumnDetails("fullname", "fullname", objectSchemaInfo);
            this.headlineColKey = addColumnDetails("headline", "headline", objectSchemaInfo);
            this.roleColKey = addColumnDetails("role", "role", objectSchemaInfo);
            this.ageColKey = addColumnDetails("age", "age", objectSchemaInfo);
            this.emailAddressColKey = addColumnDetails("emailAddress", "emailAddress", objectSchemaInfo);
            this.phoneNumberColKey = addColumnDetails("phoneNumber", "phoneNumber", objectSchemaInfo);
            this.createdAtColKey = addColumnDetails("createdAt", "createdAt", objectSchemaInfo);
            this.updatedAtColKey = addColumnDetails("updatedAt", "updatedAt", objectSchemaInfo);
        }

        UserColumnInfo(ColumnInfo src, boolean mutable) {
            super(src, mutable);
            copy(src, this);
        }

        @Override
        protected final ColumnInfo copy(boolean mutable) {
            return new UserColumnInfo(this, mutable);
        }

        @Override
        protected final void copy(ColumnInfo rawSrc, ColumnInfo rawDst) {
            final UserColumnInfo src = (UserColumnInfo) rawSrc;
            final UserColumnInfo dst = (UserColumnInfo) rawDst;
            dst.idColKey = src.idColKey;
            dst.accountColKey = src.accountColKey;
            dst.fullnameColKey = src.fullnameColKey;
            dst.headlineColKey = src.headlineColKey;
            dst.roleColKey = src.roleColKey;
            dst.ageColKey = src.ageColKey;
            dst.emailAddressColKey = src.emailAddressColKey;
            dst.phoneNumberColKey = src.phoneNumberColKey;
            dst.createdAtColKey = src.createdAtColKey;
            dst.updatedAtColKey = src.updatedAtColKey;
        }
    }

    private static final String NO_ALIAS = "";
    private static final OsObjectSchemaInfo expectedObjectSchemaInfo = createExpectedObjectSchemaInfo();

    private UserColumnInfo columnInfo;
    private ProxyState<it.ninespartans.xmanager.model.User> proxyState;

    it_ninespartans_xmanager_model_UserRealmProxy() {
        proxyState.setConstructionFinished();
    }

    @Override
    public void realm$injectObjectContext() {
        if (this.proxyState != null) {
            return;
        }
        final BaseRealm.RealmObjectContext context = BaseRealm.objectContext.get();
        this.columnInfo = (UserColumnInfo) context.getColumnInfo();
        this.proxyState = new ProxyState<it.ninespartans.xmanager.model.User>(this);
        proxyState.setRealm$realm(context.getRealm());
        proxyState.setRow$realm(context.getRow());
        proxyState.setAcceptDefaultValue$realm(context.getAcceptDefaultValue());
        proxyState.setExcludeFields$realm(context.getExcludeFields());
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$id() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.idColKey);
    }

    @Override
    public void realmSet$id(String value) {
        if (proxyState.isUnderConstruction()) {
            // default value of the primary key is always ignored.
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        throw new io.realm.exceptions.RealmException("Primary key field 'id' cannot be changed after object was created.");
    }

    @Override
    public it.ninespartans.xmanager.model.Account realmGet$account() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNullLink(columnInfo.accountColKey)) {
            return null;
        }
        return proxyState.getRealm$realm().get(it.ninespartans.xmanager.model.Account.class, proxyState.getRow$realm().getLink(columnInfo.accountColKey), false, Collections.<String>emptyList());
    }

    @Override
    public void realmSet$account(it.ninespartans.xmanager.model.Account value) {
        Realm realm = (Realm) proxyState.getRealm$realm();
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            if (proxyState.getExcludeFields$realm().contains("account")) {
                return;
            }
            if (value != null && !RealmObject.isManaged(value)) {
                value = realm.copyToRealmOrUpdate(value);
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                // Table#nullifyLink() does not support default value. Just using Row.
                row.nullifyLink(columnInfo.accountColKey);
                return;
            }
            proxyState.checkValidObject(value);
            row.getTable().setLink(columnInfo.accountColKey, row.getObjectKey(), ((RealmObjectProxy) value).realmGet$proxyState().getRow$realm().getObjectKey(), true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().nullifyLink(columnInfo.accountColKey);
            return;
        }
        proxyState.checkValidObject(value);
        proxyState.getRow$realm().setLink(columnInfo.accountColKey, ((RealmObjectProxy) value).realmGet$proxyState().getRow$realm().getObjectKey());
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$fullname() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.fullnameColKey);
    }

    @Override
    public void realmSet$fullname(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'fullname' to null.");
            }
            row.getTable().setString(columnInfo.fullnameColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'fullname' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.fullnameColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$headline() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.headlineColKey);
    }

    @Override
    public void realmSet$headline(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'headline' to null.");
            }
            row.getTable().setString(columnInfo.headlineColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'headline' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.headlineColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$role() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.roleColKey);
    }

    @Override
    public void realmSet$role(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'role' to null.");
            }
            row.getTable().setString(columnInfo.roleColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'role' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.roleColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$age() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.ageColKey);
    }

    @Override
    public void realmSet$age(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'age' to null.");
            }
            row.getTable().setString(columnInfo.ageColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'age' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.ageColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$emailAddress() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.emailAddressColKey);
    }

    @Override
    public void realmSet$emailAddress(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'emailAddress' to null.");
            }
            row.getTable().setString(columnInfo.emailAddressColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'emailAddress' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.emailAddressColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$phoneNumber() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.phoneNumberColKey);
    }

    @Override
    public void realmSet$phoneNumber(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'phoneNumber' to null.");
            }
            row.getTable().setString(columnInfo.phoneNumberColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'phoneNumber' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.phoneNumberColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public Date realmGet$createdAt() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.util.Date) proxyState.getRow$realm().getDate(columnInfo.createdAtColKey);
    }

    @Override
    public void realmSet$createdAt(Date value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'createdAt' to null.");
            }
            row.getTable().setDate(columnInfo.createdAtColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'createdAt' to null.");
        }
        proxyState.getRow$realm().setDate(columnInfo.createdAtColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public Date realmGet$updatedAt() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.util.Date) proxyState.getRow$realm().getDate(columnInfo.updatedAtColKey);
    }

    @Override
    public void realmSet$updatedAt(Date value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'updatedAt' to null.");
            }
            row.getTable().setDate(columnInfo.updatedAtColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'updatedAt' to null.");
        }
        proxyState.getRow$realm().setDate(columnInfo.updatedAtColKey, value);
    }

    private static OsObjectSchemaInfo createExpectedObjectSchemaInfo() {
        OsObjectSchemaInfo.Builder builder = new OsObjectSchemaInfo.Builder(NO_ALIAS, "User", false, 10, 0);
        builder.addPersistedProperty(NO_ALIAS, "id", RealmFieldType.STRING, Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedLinkProperty(NO_ALIAS, "account", RealmFieldType.OBJECT, "Account");
        builder.addPersistedProperty(NO_ALIAS, "fullname", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "headline", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "role", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "age", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "emailAddress", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "phoneNumber", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "createdAt", RealmFieldType.DATE, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "updatedAt", RealmFieldType.DATE, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        return builder.build();
    }

    public static OsObjectSchemaInfo getExpectedObjectSchemaInfo() {
        return expectedObjectSchemaInfo;
    }

    public static UserColumnInfo createColumnInfo(OsSchemaInfo schemaInfo) {
        return new UserColumnInfo(schemaInfo);
    }

    public static String getSimpleClassName() {
        return "User";
    }

    public static final class ClassNameHelper {
        public static final String INTERNAL_CLASS_NAME = "User";
    }

    @SuppressWarnings("cast")
    public static it.ninespartans.xmanager.model.User createOrUpdateUsingJsonObject(Realm realm, JSONObject json, boolean update)
        throws JSONException {
        final List<String> excludeFields = new ArrayList<String>(1);
        it.ninespartans.xmanager.model.User obj = null;
        if (update) {
            Table table = realm.getTable(it.ninespartans.xmanager.model.User.class);
            UserColumnInfo columnInfo = (UserColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.User.class);
            long pkColumnKey = columnInfo.idColKey;
            long objKey = Table.NO_MATCH;
            if (!json.isNull("id")) {
                objKey = table.findFirstString(pkColumnKey, json.getString("id"));
            }
            if (objKey != Table.NO_MATCH) {
                final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
                try {
                    objectContext.set(realm, table.getUncheckedRow(objKey), realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.User.class), false, Collections.<String> emptyList());
                    obj = new io.realm.it_ninespartans_xmanager_model_UserRealmProxy();
                } finally {
                    objectContext.clear();
                }
            }
        }
        if (obj == null) {
            if (json.has("account")) {
                excludeFields.add("account");
            }
            if (json.has("id")) {
                if (json.isNull("id")) {
                    obj = (io.realm.it_ninespartans_xmanager_model_UserRealmProxy) realm.createObjectInternal(it.ninespartans.xmanager.model.User.class, null, true, excludeFields);
                } else {
                    obj = (io.realm.it_ninespartans_xmanager_model_UserRealmProxy) realm.createObjectInternal(it.ninespartans.xmanager.model.User.class, json.getString("id"), true, excludeFields);
                }
            } else {
                throw new IllegalArgumentException("JSON object doesn't have the primary key field 'id'.");
            }
        }

        final it_ninespartans_xmanager_model_UserRealmProxyInterface objProxy = (it_ninespartans_xmanager_model_UserRealmProxyInterface) obj;
        if (json.has("account")) {
            if (json.isNull("account")) {
                objProxy.realmSet$account(null);
            } else {
                it.ninespartans.xmanager.model.Account accountObj = it_ninespartans_xmanager_model_AccountRealmProxy.createOrUpdateUsingJsonObject(realm, json.getJSONObject("account"), update);
                objProxy.realmSet$account(accountObj);
            }
        }
        if (json.has("fullname")) {
            if (json.isNull("fullname")) {
                objProxy.realmSet$fullname(null);
            } else {
                objProxy.realmSet$fullname((String) json.getString("fullname"));
            }
        }
        if (json.has("headline")) {
            if (json.isNull("headline")) {
                objProxy.realmSet$headline(null);
            } else {
                objProxy.realmSet$headline((String) json.getString("headline"));
            }
        }
        if (json.has("role")) {
            if (json.isNull("role")) {
                objProxy.realmSet$role(null);
            } else {
                objProxy.realmSet$role((String) json.getString("role"));
            }
        }
        if (json.has("age")) {
            if (json.isNull("age")) {
                objProxy.realmSet$age(null);
            } else {
                objProxy.realmSet$age((String) json.getString("age"));
            }
        }
        if (json.has("emailAddress")) {
            if (json.isNull("emailAddress")) {
                objProxy.realmSet$emailAddress(null);
            } else {
                objProxy.realmSet$emailAddress((String) json.getString("emailAddress"));
            }
        }
        if (json.has("phoneNumber")) {
            if (json.isNull("phoneNumber")) {
                objProxy.realmSet$phoneNumber(null);
            } else {
                objProxy.realmSet$phoneNumber((String) json.getString("phoneNumber"));
            }
        }
        if (json.has("createdAt")) {
            if (json.isNull("createdAt")) {
                objProxy.realmSet$createdAt(null);
            } else {
                Object timestamp = json.get("createdAt");
                if (timestamp instanceof String) {
                    objProxy.realmSet$createdAt(JsonUtils.stringToDate((String) timestamp));
                } else {
                    objProxy.realmSet$createdAt(new Date(json.getLong("createdAt")));
                }
            }
        }
        if (json.has("updatedAt")) {
            if (json.isNull("updatedAt")) {
                objProxy.realmSet$updatedAt(null);
            } else {
                Object timestamp = json.get("updatedAt");
                if (timestamp instanceof String) {
                    objProxy.realmSet$updatedAt(JsonUtils.stringToDate((String) timestamp));
                } else {
                    objProxy.realmSet$updatedAt(new Date(json.getLong("updatedAt")));
                }
            }
        }
        return obj;
    }

    @SuppressWarnings("cast")
    @TargetApi(Build.VERSION_CODES.HONEYCOMB)
    public static it.ninespartans.xmanager.model.User createUsingJsonStream(Realm realm, JsonReader reader)
        throws IOException {
        boolean jsonHasPrimaryKey = false;
        final it.ninespartans.xmanager.model.User obj = new it.ninespartans.xmanager.model.User();
        final it_ninespartans_xmanager_model_UserRealmProxyInterface objProxy = (it_ninespartans_xmanager_model_UserRealmProxyInterface) obj;
        reader.beginObject();
        while (reader.hasNext()) {
            String name = reader.nextName();
            if (false) {
            } else if (name.equals("id")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$id((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$id(null);
                }
                jsonHasPrimaryKey = true;
            } else if (name.equals("account")) {
                if (reader.peek() == JsonToken.NULL) {
                    reader.skipValue();
                    objProxy.realmSet$account(null);
                } else {
                    it.ninespartans.xmanager.model.Account accountObj = it_ninespartans_xmanager_model_AccountRealmProxy.createUsingJsonStream(realm, reader);
                    objProxy.realmSet$account(accountObj);
                }
            } else if (name.equals("fullname")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$fullname((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$fullname(null);
                }
            } else if (name.equals("headline")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$headline((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$headline(null);
                }
            } else if (name.equals("role")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$role((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$role(null);
                }
            } else if (name.equals("age")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$age((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$age(null);
                }
            } else if (name.equals("emailAddress")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$emailAddress((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$emailAddress(null);
                }
            } else if (name.equals("phoneNumber")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$phoneNumber((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$phoneNumber(null);
                }
            } else if (name.equals("createdAt")) {
                if (reader.peek() == JsonToken.NULL) {
                    reader.skipValue();
                    objProxy.realmSet$createdAt(null);
                } else if (reader.peek() == JsonToken.NUMBER) {
                    long timestamp = reader.nextLong();
                    if (timestamp > -1) {
                        objProxy.realmSet$createdAt(new Date(timestamp));
                    }
                } else {
                    objProxy.realmSet$createdAt(JsonUtils.stringToDate(reader.nextString()));
                }
            } else if (name.equals("updatedAt")) {
                if (reader.peek() == JsonToken.NULL) {
                    reader.skipValue();
                    objProxy.realmSet$updatedAt(null);
                } else if (reader.peek() == JsonToken.NUMBER) {
                    long timestamp = reader.nextLong();
                    if (timestamp > -1) {
                        objProxy.realmSet$updatedAt(new Date(timestamp));
                    }
                } else {
                    objProxy.realmSet$updatedAt(JsonUtils.stringToDate(reader.nextString()));
                }
            } else {
                reader.skipValue();
            }
        }
        reader.endObject();
        if (!jsonHasPrimaryKey) {
            throw new IllegalArgumentException("JSON object doesn't have the primary key field 'id'.");
        }
        return realm.copyToRealmOrUpdate(obj);
    }

    static it_ninespartans_xmanager_model_UserRealmProxy newProxyInstance(BaseRealm realm, Row row) {
        // Ignore default values to avoid creating unexpected objects from RealmModel/RealmList fields
        final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
        objectContext.set(realm, row, realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.User.class), false, Collections.<String>emptyList());
        io.realm.it_ninespartans_xmanager_model_UserRealmProxy obj = new io.realm.it_ninespartans_xmanager_model_UserRealmProxy();
        objectContext.clear();
        return obj;
    }

    public static it.ninespartans.xmanager.model.User copyOrUpdate(Realm realm, UserColumnInfo columnInfo, it.ninespartans.xmanager.model.User object, boolean update, Map<RealmModel,RealmObjectProxy> cache, Set<ImportFlag> flags) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null) {
            final BaseRealm otherRealm = ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm();
            if (otherRealm.threadId != realm.threadId) {
                throw new IllegalArgumentException("Objects which belong to Realm instances in other threads cannot be copied into this Realm instance.");
            }
            if (otherRealm.getPath().equals(realm.getPath())) {
                return object;
            }
        }
        final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
        RealmObjectProxy cachedRealmObject = cache.get(object);
        if (cachedRealmObject != null) {
            return (it.ninespartans.xmanager.model.User) cachedRealmObject;
        }

        it.ninespartans.xmanager.model.User realmObject = null;
        boolean canUpdate = update;
        if (canUpdate) {
            Table table = realm.getTable(it.ninespartans.xmanager.model.User.class);
            long pkColumnKey = columnInfo.idColKey;
            long objKey = table.findFirstString(pkColumnKey, ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$id());
            if (objKey == Table.NO_MATCH) {
                canUpdate = false;
            } else {
                try {
                    objectContext.set(realm, table.getUncheckedRow(objKey), columnInfo, false, Collections.<String> emptyList());
                    realmObject = new io.realm.it_ninespartans_xmanager_model_UserRealmProxy();
                    cache.put(object, (RealmObjectProxy) realmObject);
                } finally {
                    objectContext.clear();
                }
            }
        }

        return (canUpdate) ? update(realm, columnInfo, realmObject, object, cache, flags) : copy(realm, columnInfo, object, update, cache, flags);
    }

    public static it.ninespartans.xmanager.model.User copy(Realm realm, UserColumnInfo columnInfo, it.ninespartans.xmanager.model.User newObject, boolean update, Map<RealmModel,RealmObjectProxy> cache, Set<ImportFlag> flags) {
        RealmObjectProxy cachedRealmObject = cache.get(newObject);
        if (cachedRealmObject != null) {
            return (it.ninespartans.xmanager.model.User) cachedRealmObject;
        }

        it_ninespartans_xmanager_model_UserRealmProxyInterface unmanagedSource = (it_ninespartans_xmanager_model_UserRealmProxyInterface) newObject;

        Table table = realm.getTable(it.ninespartans.xmanager.model.User.class);
        OsObjectBuilder builder = new OsObjectBuilder(table, flags);

        // Add all non-"object reference" fields
        builder.addString(columnInfo.idColKey, unmanagedSource.realmGet$id());
        builder.addString(columnInfo.fullnameColKey, unmanagedSource.realmGet$fullname());
        builder.addString(columnInfo.headlineColKey, unmanagedSource.realmGet$headline());
        builder.addString(columnInfo.roleColKey, unmanagedSource.realmGet$role());
        builder.addString(columnInfo.ageColKey, unmanagedSource.realmGet$age());
        builder.addString(columnInfo.emailAddressColKey, unmanagedSource.realmGet$emailAddress());
        builder.addString(columnInfo.phoneNumberColKey, unmanagedSource.realmGet$phoneNumber());
        builder.addDate(columnInfo.createdAtColKey, unmanagedSource.realmGet$createdAt());
        builder.addDate(columnInfo.updatedAtColKey, unmanagedSource.realmGet$updatedAt());

        // Create the underlying object and cache it before setting any object/objectlist references
        // This will allow us to break any circular dependencies by using the object cache.
        Row row = builder.createNewObject();
        io.realm.it_ninespartans_xmanager_model_UserRealmProxy managedCopy = newProxyInstance(realm, row);
        cache.put(newObject, managedCopy);

        // Finally add all fields that reference other Realm Objects, either directly or through a list
        it.ninespartans.xmanager.model.Account accountObj = unmanagedSource.realmGet$account();
        if (accountObj == null) {
            managedCopy.realmSet$account(null);
        } else {
            it.ninespartans.xmanager.model.Account cacheaccount = (it.ninespartans.xmanager.model.Account) cache.get(accountObj);
            if (cacheaccount != null) {
                managedCopy.realmSet$account(cacheaccount);
            } else {
                managedCopy.realmSet$account(it_ninespartans_xmanager_model_AccountRealmProxy.copyOrUpdate(realm, (it_ninespartans_xmanager_model_AccountRealmProxy.AccountColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Account.class), accountObj, update, cache, flags));
            }
        }

        return managedCopy;
    }

    public static long insert(Realm realm, it.ninespartans.xmanager.model.User object, Map<RealmModel,Long> cache) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
            return ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey();
        }
        Table table = realm.getTable(it.ninespartans.xmanager.model.User.class);
        long tableNativePtr = table.getNativePtr();
        UserColumnInfo columnInfo = (UserColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.User.class);
        long pkColumnKey = columnInfo.idColKey;
        long objKey = Table.NO_MATCH;
        Object primaryKeyValue = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$id();
        if (primaryKeyValue != null) {
            objKey = Table.nativeFindFirstString(tableNativePtr, pkColumnKey, (String)primaryKeyValue);
        }
        if (objKey == Table.NO_MATCH) {
            objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
        } else {
            Table.throwDuplicatePrimaryKeyException(primaryKeyValue);
        }
        cache.put(object, objKey);

        it.ninespartans.xmanager.model.Account accountObj = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$account();
        if (accountObj != null) {
            Long cacheaccount = cache.get(accountObj);
            if (cacheaccount == null) {
                cacheaccount = it_ninespartans_xmanager_model_AccountRealmProxy.insert(realm, accountObj, cache);
            }
            Table.nativeSetLink(tableNativePtr, columnInfo.accountColKey, objKey, cacheaccount, false);
        }
        String realmGet$fullname = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$fullname();
        if (realmGet$fullname != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.fullnameColKey, objKey, realmGet$fullname, false);
        }
        String realmGet$headline = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$headline();
        if (realmGet$headline != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.headlineColKey, objKey, realmGet$headline, false);
        }
        String realmGet$role = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$role();
        if (realmGet$role != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.roleColKey, objKey, realmGet$role, false);
        }
        String realmGet$age = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$age();
        if (realmGet$age != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.ageColKey, objKey, realmGet$age, false);
        }
        String realmGet$emailAddress = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$emailAddress();
        if (realmGet$emailAddress != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.emailAddressColKey, objKey, realmGet$emailAddress, false);
        }
        String realmGet$phoneNumber = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$phoneNumber();
        if (realmGet$phoneNumber != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.phoneNumberColKey, objKey, realmGet$phoneNumber, false);
        }
        java.util.Date realmGet$createdAt = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$createdAt();
        if (realmGet$createdAt != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.createdAtColKey, objKey, realmGet$createdAt.getTime(), false);
        }
        java.util.Date realmGet$updatedAt = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$updatedAt();
        if (realmGet$updatedAt != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.updatedAtColKey, objKey, realmGet$updatedAt.getTime(), false);
        }
        return objKey;
    }

    public static void insert(Realm realm, Iterator<? extends RealmModel> objects, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(it.ninespartans.xmanager.model.User.class);
        long tableNativePtr = table.getNativePtr();
        UserColumnInfo columnInfo = (UserColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.User.class);
        long pkColumnKey = columnInfo.idColKey;
        it.ninespartans.xmanager.model.User object = null;
        while (objects.hasNext()) {
            object = (it.ninespartans.xmanager.model.User) objects.next();
            if (cache.containsKey(object)) {
                continue;
            }
            if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
                cache.put(object, ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey());
                continue;
            }
            long objKey = Table.NO_MATCH;
            Object primaryKeyValue = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$id();
            if (primaryKeyValue != null) {
                objKey = Table.nativeFindFirstString(tableNativePtr, pkColumnKey, (String)primaryKeyValue);
            }
            if (objKey == Table.NO_MATCH) {
                objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
            } else {
                Table.throwDuplicatePrimaryKeyException(primaryKeyValue);
            }
            cache.put(object, objKey);

            it.ninespartans.xmanager.model.Account accountObj = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$account();
            if (accountObj != null) {
                Long cacheaccount = cache.get(accountObj);
                if (cacheaccount == null) {
                    cacheaccount = it_ninespartans_xmanager_model_AccountRealmProxy.insert(realm, accountObj, cache);
                }
                Table.nativeSetLink(tableNativePtr, columnInfo.accountColKey, objKey, cacheaccount, false);
            }
            String realmGet$fullname = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$fullname();
            if (realmGet$fullname != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.fullnameColKey, objKey, realmGet$fullname, false);
            }
            String realmGet$headline = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$headline();
            if (realmGet$headline != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.headlineColKey, objKey, realmGet$headline, false);
            }
            String realmGet$role = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$role();
            if (realmGet$role != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.roleColKey, objKey, realmGet$role, false);
            }
            String realmGet$age = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$age();
            if (realmGet$age != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.ageColKey, objKey, realmGet$age, false);
            }
            String realmGet$emailAddress = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$emailAddress();
            if (realmGet$emailAddress != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.emailAddressColKey, objKey, realmGet$emailAddress, false);
            }
            String realmGet$phoneNumber = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$phoneNumber();
            if (realmGet$phoneNumber != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.phoneNumberColKey, objKey, realmGet$phoneNumber, false);
            }
            java.util.Date realmGet$createdAt = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$createdAt();
            if (realmGet$createdAt != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.createdAtColKey, objKey, realmGet$createdAt.getTime(), false);
            }
            java.util.Date realmGet$updatedAt = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$updatedAt();
            if (realmGet$updatedAt != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.updatedAtColKey, objKey, realmGet$updatedAt.getTime(), false);
            }
        }
    }

    public static long insertOrUpdate(Realm realm, it.ninespartans.xmanager.model.User object, Map<RealmModel,Long> cache) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
            return ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey();
        }
        Table table = realm.getTable(it.ninespartans.xmanager.model.User.class);
        long tableNativePtr = table.getNativePtr();
        UserColumnInfo columnInfo = (UserColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.User.class);
        long pkColumnKey = columnInfo.idColKey;
        long objKey = Table.NO_MATCH;
        Object primaryKeyValue = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$id();
        if (primaryKeyValue != null) {
            objKey = Table.nativeFindFirstString(tableNativePtr, pkColumnKey, (String)primaryKeyValue);
        }
        if (objKey == Table.NO_MATCH) {
            objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
        }
        cache.put(object, objKey);

        it.ninespartans.xmanager.model.Account accountObj = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$account();
        if (accountObj != null) {
            Long cacheaccount = cache.get(accountObj);
            if (cacheaccount == null) {
                cacheaccount = it_ninespartans_xmanager_model_AccountRealmProxy.insertOrUpdate(realm, accountObj, cache);
            }
            Table.nativeSetLink(tableNativePtr, columnInfo.accountColKey, objKey, cacheaccount, false);
        } else {
            Table.nativeNullifyLink(tableNativePtr, columnInfo.accountColKey, objKey);
        }
        String realmGet$fullname = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$fullname();
        if (realmGet$fullname != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.fullnameColKey, objKey, realmGet$fullname, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.fullnameColKey, objKey, false);
        }
        String realmGet$headline = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$headline();
        if (realmGet$headline != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.headlineColKey, objKey, realmGet$headline, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.headlineColKey, objKey, false);
        }
        String realmGet$role = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$role();
        if (realmGet$role != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.roleColKey, objKey, realmGet$role, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.roleColKey, objKey, false);
        }
        String realmGet$age = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$age();
        if (realmGet$age != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.ageColKey, objKey, realmGet$age, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.ageColKey, objKey, false);
        }
        String realmGet$emailAddress = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$emailAddress();
        if (realmGet$emailAddress != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.emailAddressColKey, objKey, realmGet$emailAddress, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.emailAddressColKey, objKey, false);
        }
        String realmGet$phoneNumber = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$phoneNumber();
        if (realmGet$phoneNumber != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.phoneNumberColKey, objKey, realmGet$phoneNumber, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.phoneNumberColKey, objKey, false);
        }
        java.util.Date realmGet$createdAt = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$createdAt();
        if (realmGet$createdAt != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.createdAtColKey, objKey, realmGet$createdAt.getTime(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.createdAtColKey, objKey, false);
        }
        java.util.Date realmGet$updatedAt = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$updatedAt();
        if (realmGet$updatedAt != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.updatedAtColKey, objKey, realmGet$updatedAt.getTime(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.updatedAtColKey, objKey, false);
        }
        return objKey;
    }

    public static void insertOrUpdate(Realm realm, Iterator<? extends RealmModel> objects, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(it.ninespartans.xmanager.model.User.class);
        long tableNativePtr = table.getNativePtr();
        UserColumnInfo columnInfo = (UserColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.User.class);
        long pkColumnKey = columnInfo.idColKey;
        it.ninespartans.xmanager.model.User object = null;
        while (objects.hasNext()) {
            object = (it.ninespartans.xmanager.model.User) objects.next();
            if (cache.containsKey(object)) {
                continue;
            }
            if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
                cache.put(object, ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey());
                continue;
            }
            long objKey = Table.NO_MATCH;
            Object primaryKeyValue = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$id();
            if (primaryKeyValue != null) {
                objKey = Table.nativeFindFirstString(tableNativePtr, pkColumnKey, (String)primaryKeyValue);
            }
            if (objKey == Table.NO_MATCH) {
                objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
            }
            cache.put(object, objKey);

            it.ninespartans.xmanager.model.Account accountObj = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$account();
            if (accountObj != null) {
                Long cacheaccount = cache.get(accountObj);
                if (cacheaccount == null) {
                    cacheaccount = it_ninespartans_xmanager_model_AccountRealmProxy.insertOrUpdate(realm, accountObj, cache);
                }
                Table.nativeSetLink(tableNativePtr, columnInfo.accountColKey, objKey, cacheaccount, false);
            } else {
                Table.nativeNullifyLink(tableNativePtr, columnInfo.accountColKey, objKey);
            }
            String realmGet$fullname = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$fullname();
            if (realmGet$fullname != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.fullnameColKey, objKey, realmGet$fullname, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.fullnameColKey, objKey, false);
            }
            String realmGet$headline = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$headline();
            if (realmGet$headline != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.headlineColKey, objKey, realmGet$headline, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.headlineColKey, objKey, false);
            }
            String realmGet$role = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$role();
            if (realmGet$role != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.roleColKey, objKey, realmGet$role, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.roleColKey, objKey, false);
            }
            String realmGet$age = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$age();
            if (realmGet$age != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.ageColKey, objKey, realmGet$age, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.ageColKey, objKey, false);
            }
            String realmGet$emailAddress = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$emailAddress();
            if (realmGet$emailAddress != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.emailAddressColKey, objKey, realmGet$emailAddress, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.emailAddressColKey, objKey, false);
            }
            String realmGet$phoneNumber = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$phoneNumber();
            if (realmGet$phoneNumber != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.phoneNumberColKey, objKey, realmGet$phoneNumber, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.phoneNumberColKey, objKey, false);
            }
            java.util.Date realmGet$createdAt = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$createdAt();
            if (realmGet$createdAt != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.createdAtColKey, objKey, realmGet$createdAt.getTime(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.createdAtColKey, objKey, false);
            }
            java.util.Date realmGet$updatedAt = ((it_ninespartans_xmanager_model_UserRealmProxyInterface) object).realmGet$updatedAt();
            if (realmGet$updatedAt != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.updatedAtColKey, objKey, realmGet$updatedAt.getTime(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.updatedAtColKey, objKey, false);
            }
        }
    }

    public static it.ninespartans.xmanager.model.User createDetachedCopy(it.ninespartans.xmanager.model.User realmObject, int currentDepth, int maxDepth, Map<RealmModel, CacheData<RealmModel>> cache) {
        if (currentDepth > maxDepth || realmObject == null) {
            return null;
        }
        CacheData<RealmModel> cachedObject = cache.get(realmObject);
        it.ninespartans.xmanager.model.User unmanagedObject;
        if (cachedObject == null) {
            unmanagedObject = new it.ninespartans.xmanager.model.User();
            cache.put(realmObject, new RealmObjectProxy.CacheData<RealmModel>(currentDepth, unmanagedObject));
        } else {
            // Reuse cached object or recreate it because it was encountered at a lower depth.
            if (currentDepth >= cachedObject.minDepth) {
                return (it.ninespartans.xmanager.model.User) cachedObject.object;
            }
            unmanagedObject = (it.ninespartans.xmanager.model.User) cachedObject.object;
            cachedObject.minDepth = currentDepth;
        }
        it_ninespartans_xmanager_model_UserRealmProxyInterface unmanagedCopy = (it_ninespartans_xmanager_model_UserRealmProxyInterface) unmanagedObject;
        it_ninespartans_xmanager_model_UserRealmProxyInterface realmSource = (it_ninespartans_xmanager_model_UserRealmProxyInterface) realmObject;
        Realm objectRealm = (Realm) ((RealmObjectProxy) realmObject).realmGet$proxyState().getRealm$realm();
        unmanagedCopy.realmSet$id(realmSource.realmGet$id());

        // Deep copy of account
        unmanagedCopy.realmSet$account(it_ninespartans_xmanager_model_AccountRealmProxy.createDetachedCopy(realmSource.realmGet$account(), currentDepth + 1, maxDepth, cache));
        unmanagedCopy.realmSet$fullname(realmSource.realmGet$fullname());
        unmanagedCopy.realmSet$headline(realmSource.realmGet$headline());
        unmanagedCopy.realmSet$role(realmSource.realmGet$role());
        unmanagedCopy.realmSet$age(realmSource.realmGet$age());
        unmanagedCopy.realmSet$emailAddress(realmSource.realmGet$emailAddress());
        unmanagedCopy.realmSet$phoneNumber(realmSource.realmGet$phoneNumber());
        unmanagedCopy.realmSet$createdAt(realmSource.realmGet$createdAt());
        unmanagedCopy.realmSet$updatedAt(realmSource.realmGet$updatedAt());

        return unmanagedObject;
    }

    static it.ninespartans.xmanager.model.User update(Realm realm, UserColumnInfo columnInfo, it.ninespartans.xmanager.model.User realmObject, it.ninespartans.xmanager.model.User newObject, Map<RealmModel, RealmObjectProxy> cache, Set<ImportFlag> flags) {
        it_ninespartans_xmanager_model_UserRealmProxyInterface realmObjectTarget = (it_ninespartans_xmanager_model_UserRealmProxyInterface) realmObject;
        it_ninespartans_xmanager_model_UserRealmProxyInterface realmObjectSource = (it_ninespartans_xmanager_model_UserRealmProxyInterface) newObject;
        Table table = realm.getTable(it.ninespartans.xmanager.model.User.class);
        OsObjectBuilder builder = new OsObjectBuilder(table, flags);
        builder.addString(columnInfo.idColKey, realmObjectSource.realmGet$id());

        it.ninespartans.xmanager.model.Account accountObj = realmObjectSource.realmGet$account();
        if (accountObj == null) {
            builder.addNull(columnInfo.accountColKey);
        } else {
            it.ninespartans.xmanager.model.Account cacheaccount = (it.ninespartans.xmanager.model.Account) cache.get(accountObj);
            if (cacheaccount != null) {
                builder.addObject(columnInfo.accountColKey, cacheaccount);
            } else {
                builder.addObject(columnInfo.accountColKey, it_ninespartans_xmanager_model_AccountRealmProxy.copyOrUpdate(realm, (it_ninespartans_xmanager_model_AccountRealmProxy.AccountColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Account.class), accountObj, true, cache, flags));
            }
        }
        builder.addString(columnInfo.fullnameColKey, realmObjectSource.realmGet$fullname());
        builder.addString(columnInfo.headlineColKey, realmObjectSource.realmGet$headline());
        builder.addString(columnInfo.roleColKey, realmObjectSource.realmGet$role());
        builder.addString(columnInfo.ageColKey, realmObjectSource.realmGet$age());
        builder.addString(columnInfo.emailAddressColKey, realmObjectSource.realmGet$emailAddress());
        builder.addString(columnInfo.phoneNumberColKey, realmObjectSource.realmGet$phoneNumber());
        builder.addDate(columnInfo.createdAtColKey, realmObjectSource.realmGet$createdAt());
        builder.addDate(columnInfo.updatedAtColKey, realmObjectSource.realmGet$updatedAt());

        builder.updateExistingTopLevelObject();
        return realmObject;
    }

    @Override
    @SuppressWarnings("ArrayToString")
    public String toString() {
        if (!RealmObject.isValid(this)) {
            return "Invalid object";
        }
        StringBuilder stringBuilder = new StringBuilder("User = proxy[");
        stringBuilder.append("{id:");
        stringBuilder.append(realmGet$id());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{account:");
        stringBuilder.append(realmGet$account() != null ? "Account" : "null");
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{fullname:");
        stringBuilder.append(realmGet$fullname());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{headline:");
        stringBuilder.append(realmGet$headline());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{role:");
        stringBuilder.append(realmGet$role());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{age:");
        stringBuilder.append(realmGet$age());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{emailAddress:");
        stringBuilder.append(realmGet$emailAddress());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{phoneNumber:");
        stringBuilder.append(realmGet$phoneNumber());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{createdAt:");
        stringBuilder.append(realmGet$createdAt());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{updatedAt:");
        stringBuilder.append(realmGet$updatedAt());
        stringBuilder.append("}");
        stringBuilder.append("]");
        return stringBuilder.toString();
    }

    @Override
    public ProxyState<?> realmGet$proxyState() {
        return proxyState;
    }

    @Override
    public int hashCode() {
        String realmName = proxyState.getRealm$realm().getPath();
        String tableName = proxyState.getRow$realm().getTable().getName();
        long objKey = proxyState.getRow$realm().getObjectKey();

        int result = 17;
        result = 31 * result + ((realmName != null) ? realmName.hashCode() : 0);
        result = 31 * result + ((tableName != null) ? tableName.hashCode() : 0);
        result = 31 * result + (int) (objKey ^ (objKey >>> 32));
        return result;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        it_ninespartans_xmanager_model_UserRealmProxy aUser = (it_ninespartans_xmanager_model_UserRealmProxy)o;

        BaseRealm realm = proxyState.getRealm$realm();
        BaseRealm otherRealm = aUser.proxyState.getRealm$realm();
        String path = realm.getPath();
        String otherPath = otherRealm.getPath();
        if (path != null ? !path.equals(otherPath) : otherPath != null) return false;
        if (realm.isFrozen() != otherRealm.isFrozen()) return false;
        if (!realm.sharedRealm.getVersionID().equals(otherRealm.sharedRealm.getVersionID())) {
            return false;
        }

        String tableName = proxyState.getRow$realm().getTable().getName();
        String otherTableName = aUser.proxyState.getRow$realm().getTable().getName();
        if (tableName != null ? !tableName.equals(otherTableName) : otherTableName != null) return false;

        if (proxyState.getRow$realm().getObjectKey() != aUser.proxyState.getRow$realm().getObjectKey()) return false;

        return true;
    }
}
