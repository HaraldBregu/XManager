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
public class com_ninespartans_xmanager_model_DeviceProgramRealmProxy extends com.ninespartans.xmanager.model.DeviceProgram
    implements RealmObjectProxy, com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface {

    static final class DeviceProgramColumnInfo extends ColumnInfo {
        long _idColKey;
        long titleColKey;
        long descriptionColKey;
        long activeColKey;
        long dataColKey;
        long creatorColKey;
        long startDateColKey;
        long createdAtColKey;
        long updatedAtColKey;

        DeviceProgramColumnInfo(OsSchemaInfo schemaInfo) {
            super(9);
            OsObjectSchemaInfo objectSchemaInfo = schemaInfo.getObjectSchemaInfo("DeviceProgram");
            this._idColKey = addColumnDetails("_id", "_id", objectSchemaInfo);
            this.titleColKey = addColumnDetails("title", "title", objectSchemaInfo);
            this.descriptionColKey = addColumnDetails("description", "description", objectSchemaInfo);
            this.activeColKey = addColumnDetails("active", "active", objectSchemaInfo);
            this.dataColKey = addColumnDetails("data", "data", objectSchemaInfo);
            this.creatorColKey = addColumnDetails("creator", "creator", objectSchemaInfo);
            this.startDateColKey = addColumnDetails("startDate", "startDate", objectSchemaInfo);
            this.createdAtColKey = addColumnDetails("createdAt", "createdAt", objectSchemaInfo);
            this.updatedAtColKey = addColumnDetails("updatedAt", "updatedAt", objectSchemaInfo);
        }

        DeviceProgramColumnInfo(ColumnInfo src, boolean mutable) {
            super(src, mutable);
            copy(src, this);
        }

        @Override
        protected final ColumnInfo copy(boolean mutable) {
            return new DeviceProgramColumnInfo(this, mutable);
        }

        @Override
        protected final void copy(ColumnInfo rawSrc, ColumnInfo rawDst) {
            final DeviceProgramColumnInfo src = (DeviceProgramColumnInfo) rawSrc;
            final DeviceProgramColumnInfo dst = (DeviceProgramColumnInfo) rawDst;
            dst._idColKey = src._idColKey;
            dst.titleColKey = src.titleColKey;
            dst.descriptionColKey = src.descriptionColKey;
            dst.activeColKey = src.activeColKey;
            dst.dataColKey = src.dataColKey;
            dst.creatorColKey = src.creatorColKey;
            dst.startDateColKey = src.startDateColKey;
            dst.createdAtColKey = src.createdAtColKey;
            dst.updatedAtColKey = src.updatedAtColKey;
        }
    }

    private static final String NO_ALIAS = "";
    private static final OsObjectSchemaInfo expectedObjectSchemaInfo = createExpectedObjectSchemaInfo();

    private DeviceProgramColumnInfo columnInfo;
    private ProxyState<com.ninespartans.xmanager.model.DeviceProgram> proxyState;
    private RealmList<com.ninespartans.xmanager.model.ProgramData> dataRealmList;

    com_ninespartans_xmanager_model_DeviceProgramRealmProxy() {
        proxyState.setConstructionFinished();
    }

    @Override
    public void realm$injectObjectContext() {
        if (this.proxyState != null) {
            return;
        }
        final BaseRealm.RealmObjectContext context = BaseRealm.objectContext.get();
        this.columnInfo = (DeviceProgramColumnInfo) context.getColumnInfo();
        this.proxyState = new ProxyState<com.ninespartans.xmanager.model.DeviceProgram>(this);
        proxyState.setRealm$realm(context.getRealm());
        proxyState.setRow$realm(context.getRow());
        proxyState.setAcceptDefaultValue$realm(context.getAcceptDefaultValue());
        proxyState.setExcludeFields$realm(context.getExcludeFields());
    }

    @Override
    @SuppressWarnings("cast")
    public org.bson.types.ObjectId realmGet$_id() {
        proxyState.getRealm$realm().checkIfValid();
        return (org.bson.types.ObjectId) proxyState.getRow$realm().getObjectId(columnInfo._idColKey);
    }

    @Override
    public void realmSet$_id(org.bson.types.ObjectId value) {
        if (proxyState.isUnderConstruction()) {
            // default value of the primary key is always ignored.
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        throw new io.realm.exceptions.RealmException("Primary key field '_id' cannot be changed after object was created.");
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$title() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.titleColKey);
    }

    @Override
    public void realmSet$title(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'title' to null.");
            }
            row.getTable().setString(columnInfo.titleColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'title' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.titleColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$description() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.descriptionColKey);
    }

    @Override
    public void realmSet$description(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'description' to null.");
            }
            row.getTable().setString(columnInfo.descriptionColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'description' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.descriptionColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public boolean realmGet$active() {
        proxyState.getRealm$realm().checkIfValid();
        return (boolean) proxyState.getRow$realm().getBoolean(columnInfo.activeColKey);
    }

    @Override
    public void realmSet$active(boolean value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            row.getTable().setBoolean(columnInfo.activeColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        proxyState.getRow$realm().setBoolean(columnInfo.activeColKey, value);
    }

    @Override
    public RealmList<com.ninespartans.xmanager.model.ProgramData> realmGet$data() {
        proxyState.getRealm$realm().checkIfValid();
        // use the cached value if available
        if (dataRealmList != null) {
            return dataRealmList;
        } else {
            OsList osList = proxyState.getRow$realm().getModelList(columnInfo.dataColKey);
            dataRealmList = new RealmList<com.ninespartans.xmanager.model.ProgramData>(com.ninespartans.xmanager.model.ProgramData.class, osList, proxyState.getRealm$realm());
            return dataRealmList;
        }
    }

    @Override
    public void realmSet$data(RealmList<com.ninespartans.xmanager.model.ProgramData> value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            if (proxyState.getExcludeFields$realm().contains("data")) {
                return;
            }
            // if the list contains unmanaged RealmObjects, convert them to managed.
            if (value != null && !value.isManaged()) {
                final Realm realm = (Realm) proxyState.getRealm$realm();
                final RealmList<com.ninespartans.xmanager.model.ProgramData> original = value;
                value = new RealmList<com.ninespartans.xmanager.model.ProgramData>();
                for (com.ninespartans.xmanager.model.ProgramData item : original) {
                    if (item == null || RealmObject.isManaged(item)) {
                        value.add(item);
                    } else {
                        value.add(realm.copyToRealm(item));
                    }
                }
            }
        }

        proxyState.getRealm$realm().checkIfValid();
        OsList osList = proxyState.getRow$realm().getModelList(columnInfo.dataColKey);
        // For lists of equal lengths, we need to set each element directly as clearing the receiver list can be wrong if the input and target list are the same.
        if (value != null && value.size() == osList.size()) {
            int objects = value.size();
            for (int i = 0; i < objects; i++) {
                com.ninespartans.xmanager.model.ProgramData linkedObject = value.get(i);
                proxyState.checkValidObject(linkedObject);
                osList.setRow(i, ((RealmObjectProxy) linkedObject).realmGet$proxyState().getRow$realm().getObjectKey());
            }
        } else {
            osList.removeAll();
            if (value == null) {
                return;
            }
            int objects = value.size();
            for (int i = 0; i < objects; i++) {
                com.ninespartans.xmanager.model.ProgramData linkedObject = value.get(i);
                proxyState.checkValidObject(linkedObject);
                osList.addRow(((RealmObjectProxy) linkedObject).realmGet$proxyState().getRow$realm().getObjectKey());
            }
        }
    }

    @Override
    public com.ninespartans.xmanager.model.User realmGet$creator() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNullLink(columnInfo.creatorColKey)) {
            return null;
        }
        return proxyState.getRealm$realm().get(com.ninespartans.xmanager.model.User.class, proxyState.getRow$realm().getLink(columnInfo.creatorColKey), false, Collections.<String>emptyList());
    }

    @Override
    public void realmSet$creator(com.ninespartans.xmanager.model.User value) {
        Realm realm = (Realm) proxyState.getRealm$realm();
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            if (proxyState.getExcludeFields$realm().contains("creator")) {
                return;
            }
            if (value != null && !RealmObject.isManaged(value)) {
                value = realm.copyToRealmOrUpdate(value);
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                // Table#nullifyLink() does not support default value. Just using Row.
                row.nullifyLink(columnInfo.creatorColKey);
                return;
            }
            proxyState.checkValidObject(value);
            row.getTable().setLink(columnInfo.creatorColKey, row.getObjectKey(), ((RealmObjectProxy) value).realmGet$proxyState().getRow$realm().getObjectKey(), true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().nullifyLink(columnInfo.creatorColKey);
            return;
        }
        proxyState.checkValidObject(value);
        proxyState.getRow$realm().setLink(columnInfo.creatorColKey, ((RealmObjectProxy) value).realmGet$proxyState().getRow$realm().getObjectKey());
    }

    @Override
    @SuppressWarnings("cast")
    public Date realmGet$startDate() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNull(columnInfo.startDateColKey)) {
            return null;
        }
        return (java.util.Date) proxyState.getRow$realm().getDate(columnInfo.startDateColKey);
    }

    @Override
    public void realmSet$startDate(Date value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                row.getTable().setNull(columnInfo.startDateColKey, row.getObjectKey(), true);
                return;
            }
            row.getTable().setDate(columnInfo.startDateColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().setNull(columnInfo.startDateColKey);
            return;
        }
        proxyState.getRow$realm().setDate(columnInfo.startDateColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public Date realmGet$createdAt() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNull(columnInfo.createdAtColKey)) {
            return null;
        }
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
                row.getTable().setNull(columnInfo.createdAtColKey, row.getObjectKey(), true);
                return;
            }
            row.getTable().setDate(columnInfo.createdAtColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().setNull(columnInfo.createdAtColKey);
            return;
        }
        proxyState.getRow$realm().setDate(columnInfo.createdAtColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public Date realmGet$updatedAt() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNull(columnInfo.updatedAtColKey)) {
            return null;
        }
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
                row.getTable().setNull(columnInfo.updatedAtColKey, row.getObjectKey(), true);
                return;
            }
            row.getTable().setDate(columnInfo.updatedAtColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().setNull(columnInfo.updatedAtColKey);
            return;
        }
        proxyState.getRow$realm().setDate(columnInfo.updatedAtColKey, value);
    }

    private static OsObjectSchemaInfo createExpectedObjectSchemaInfo() {
        OsObjectSchemaInfo.Builder builder = new OsObjectSchemaInfo.Builder(NO_ALIAS, "DeviceProgram", false, 9, 0);
        builder.addPersistedProperty(NO_ALIAS, "_id", RealmFieldType.OBJECT_ID, Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "title", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "description", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "active", RealmFieldType.BOOLEAN, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedLinkProperty(NO_ALIAS, "data", RealmFieldType.LIST, "ProgramData");
        builder.addPersistedLinkProperty(NO_ALIAS, "creator", RealmFieldType.OBJECT, "User");
        builder.addPersistedProperty(NO_ALIAS, "startDate", RealmFieldType.DATE, !Property.PRIMARY_KEY, !Property.INDEXED, !Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "createdAt", RealmFieldType.DATE, !Property.PRIMARY_KEY, !Property.INDEXED, !Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "updatedAt", RealmFieldType.DATE, !Property.PRIMARY_KEY, !Property.INDEXED, !Property.REQUIRED);
        return builder.build();
    }

    public static OsObjectSchemaInfo getExpectedObjectSchemaInfo() {
        return expectedObjectSchemaInfo;
    }

    public static DeviceProgramColumnInfo createColumnInfo(OsSchemaInfo schemaInfo) {
        return new DeviceProgramColumnInfo(schemaInfo);
    }

    public static String getSimpleClassName() {
        return "DeviceProgram";
    }

    public static final class ClassNameHelper {
        public static final String INTERNAL_CLASS_NAME = "DeviceProgram";
    }

    @SuppressWarnings("cast")
    public static com.ninespartans.xmanager.model.DeviceProgram createOrUpdateUsingJsonObject(Realm realm, JSONObject json, boolean update)
        throws JSONException {
        final List<String> excludeFields = new ArrayList<String>(2);
        com.ninespartans.xmanager.model.DeviceProgram obj = null;
        if (update) {
            Table table = realm.getTable(com.ninespartans.xmanager.model.DeviceProgram.class);
            DeviceProgramColumnInfo columnInfo = (DeviceProgramColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.DeviceProgram.class);
            long pkColumnKey = columnInfo._idColKey;
            long objKey = Table.NO_MATCH;
            if (!json.isNull("_id")) {
                objKey = table.findFirstObjectId(pkColumnKey, (org.bson.types.ObjectId)json.get("_id"));
            }
            if (objKey != Table.NO_MATCH) {
                final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
                try {
                    objectContext.set(realm, table.getUncheckedRow(objKey), realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.DeviceProgram.class), false, Collections.<String> emptyList());
                    obj = new io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy();
                } finally {
                    objectContext.clear();
                }
            }
        }
        if (obj == null) {
            if (json.has("data")) {
                excludeFields.add("data");
            }
            if (json.has("creator")) {
                excludeFields.add("creator");
            }
            if (json.has("_id")) {
                if (json.isNull("_id")) {
                    obj = (io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy) realm.createObjectInternal(com.ninespartans.xmanager.model.DeviceProgram.class, null, true, excludeFields);
                } else {
                    obj = (io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy) realm.createObjectInternal(com.ninespartans.xmanager.model.DeviceProgram.class, json.get("_id"), true, excludeFields);
                }
            } else {
                throw new IllegalArgumentException("JSON object doesn't have the primary key field '_id'.");
            }
        }

        final com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface objProxy = (com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) obj;
        if (json.has("title")) {
            if (json.isNull("title")) {
                objProxy.realmSet$title(null);
            } else {
                objProxy.realmSet$title((String) json.getString("title"));
            }
        }
        if (json.has("description")) {
            if (json.isNull("description")) {
                objProxy.realmSet$description(null);
            } else {
                objProxy.realmSet$description((String) json.getString("description"));
            }
        }
        if (json.has("active")) {
            if (json.isNull("active")) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'active' to null.");
            } else {
                objProxy.realmSet$active((boolean) json.getBoolean("active"));
            }
        }
        if (json.has("data")) {
            if (json.isNull("data")) {
                objProxy.realmSet$data(null);
            } else {
                objProxy.realmGet$data().clear();
                JSONArray array = json.getJSONArray("data");
                for (int i = 0; i < array.length(); i++) {
                    com_ninespartans_xmanager_model_ProgramDataRealmProxy.createOrUpdateEmbeddedUsingJsonObject(realm, (RealmModel)objProxy, "data", array.getJSONObject(i), update);
                }
            }
        }
        if (json.has("creator")) {
            if (json.isNull("creator")) {
                objProxy.realmSet$creator(null);
            } else {
                com.ninespartans.xmanager.model.User creatorObj = com_ninespartans_xmanager_model_UserRealmProxy.createOrUpdateUsingJsonObject(realm, json.getJSONObject("creator"), update);
                objProxy.realmSet$creator(creatorObj);
            }
        }
        if (json.has("startDate")) {
            if (json.isNull("startDate")) {
                objProxy.realmSet$startDate(null);
            } else {
                Object timestamp = json.get("startDate");
                if (timestamp instanceof String) {
                    objProxy.realmSet$startDate(JsonUtils.stringToDate((String) timestamp));
                } else {
                    objProxy.realmSet$startDate(new Date(json.getLong("startDate")));
                }
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
    public static com.ninespartans.xmanager.model.DeviceProgram createUsingJsonStream(Realm realm, JsonReader reader)
        throws IOException {
        boolean jsonHasPrimaryKey = false;
        final com.ninespartans.xmanager.model.DeviceProgram obj = new com.ninespartans.xmanager.model.DeviceProgram();
        final com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface objProxy = (com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) obj;
        reader.beginObject();
        while (reader.hasNext()) {
            String name = reader.nextName();
            if (false) {
            } else if (name.equals("_id")) {
                if (reader.peek() == JsonToken.NULL) {
                    reader.skipValue();
                    objProxy.realmSet$_id(null);
                } else {
                    objProxy.realmSet$_id(new org.bson.types.ObjectId(reader.nextString()));
                }
            } else if (name.equals("title")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$title((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$title(null);
                }
            } else if (name.equals("description")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$description((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$description(null);
                }
            } else if (name.equals("active")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$active((boolean) reader.nextBoolean());
                } else {
                    reader.skipValue();
                    throw new IllegalArgumentException("Trying to set non-nullable field 'active' to null.");
                }
            } else if (name.equals("data")) {
                if (reader.peek() == JsonToken.NULL) {
                    reader.skipValue();
                    objProxy.realmSet$data(null);
                } else {
                    objProxy.realmSet$data(new RealmList<com.ninespartans.xmanager.model.ProgramData>());
                    reader.beginArray();
                    while (reader.hasNext()) {
                        com.ninespartans.xmanager.model.ProgramData item = com_ninespartans_xmanager_model_ProgramDataRealmProxy.createUsingJsonStream(realm, reader);
                        objProxy.realmGet$data().add(item);
                    }
                    reader.endArray();
                }
            } else if (name.equals("creator")) {
                if (reader.peek() == JsonToken.NULL) {
                    reader.skipValue();
                    objProxy.realmSet$creator(null);
                } else {
                    com.ninespartans.xmanager.model.User creatorObj = com_ninespartans_xmanager_model_UserRealmProxy.createUsingJsonStream(realm, reader);
                    objProxy.realmSet$creator(creatorObj);
                }
            } else if (name.equals("startDate")) {
                if (reader.peek() == JsonToken.NULL) {
                    reader.skipValue();
                    objProxy.realmSet$startDate(null);
                } else if (reader.peek() == JsonToken.NUMBER) {
                    long timestamp = reader.nextLong();
                    if (timestamp > -1) {
                        objProxy.realmSet$startDate(new Date(timestamp));
                    }
                } else {
                    objProxy.realmSet$startDate(JsonUtils.stringToDate(reader.nextString()));
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
            throw new IllegalArgumentException("JSON object doesn't have the primary key field '_id'.");
        }
        return realm.copyToRealmOrUpdate(obj);
    }

    static com_ninespartans_xmanager_model_DeviceProgramRealmProxy newProxyInstance(BaseRealm realm, Row row) {
        // Ignore default values to avoid creating unexpected objects from RealmModel/RealmList fields
        final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
        objectContext.set(realm, row, realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.DeviceProgram.class), false, Collections.<String>emptyList());
        io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy obj = new io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy();
        objectContext.clear();
        return obj;
    }

    public static com.ninespartans.xmanager.model.DeviceProgram copyOrUpdate(Realm realm, DeviceProgramColumnInfo columnInfo, com.ninespartans.xmanager.model.DeviceProgram object, boolean update, Map<RealmModel,RealmObjectProxy> cache, Set<ImportFlag> flags) {
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
            return (com.ninespartans.xmanager.model.DeviceProgram) cachedRealmObject;
        }

        com.ninespartans.xmanager.model.DeviceProgram realmObject = null;
        boolean canUpdate = update;
        if (canUpdate) {
            Table table = realm.getTable(com.ninespartans.xmanager.model.DeviceProgram.class);
            long pkColumnKey = columnInfo._idColKey;
            long objKey = table.findFirstObjectId(pkColumnKey, ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$_id());
            if (objKey == Table.NO_MATCH) {
                canUpdate = false;
            } else {
                try {
                    objectContext.set(realm, table.getUncheckedRow(objKey), columnInfo, false, Collections.<String> emptyList());
                    realmObject = new io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy();
                    cache.put(object, (RealmObjectProxy) realmObject);
                } finally {
                    objectContext.clear();
                }
            }
        }

        return (canUpdate) ? update(realm, columnInfo, realmObject, object, cache, flags) : copy(realm, columnInfo, object, update, cache, flags);
    }

    public static com.ninespartans.xmanager.model.DeviceProgram copy(Realm realm, DeviceProgramColumnInfo columnInfo, com.ninespartans.xmanager.model.DeviceProgram newObject, boolean update, Map<RealmModel,RealmObjectProxy> cache, Set<ImportFlag> flags) {
        RealmObjectProxy cachedRealmObject = cache.get(newObject);
        if (cachedRealmObject != null) {
            return (com.ninespartans.xmanager.model.DeviceProgram) cachedRealmObject;
        }

        com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface unmanagedSource = (com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) newObject;

        Table table = realm.getTable(com.ninespartans.xmanager.model.DeviceProgram.class);
        OsObjectBuilder builder = new OsObjectBuilder(table, flags);

        // Add all non-"object reference" fields
        builder.addObjectId(columnInfo._idColKey, unmanagedSource.realmGet$_id());
        builder.addString(columnInfo.titleColKey, unmanagedSource.realmGet$title());
        builder.addString(columnInfo.descriptionColKey, unmanagedSource.realmGet$description());
        builder.addBoolean(columnInfo.activeColKey, unmanagedSource.realmGet$active());
        builder.addDate(columnInfo.startDateColKey, unmanagedSource.realmGet$startDate());
        builder.addDate(columnInfo.createdAtColKey, unmanagedSource.realmGet$createdAt());
        builder.addDate(columnInfo.updatedAtColKey, unmanagedSource.realmGet$updatedAt());

        // Create the underlying object and cache it before setting any object/objectlist references
        // This will allow us to break any circular dependencies by using the object cache.
        Row row = builder.createNewObject();
        io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy managedCopy = newProxyInstance(realm, row);
        cache.put(newObject, managedCopy);

        // Finally add all fields that reference other Realm Objects, either directly or through a list
        RealmList<com.ninespartans.xmanager.model.ProgramData> dataUnmanagedList = unmanagedSource.realmGet$data();
        if (dataUnmanagedList != null) {
            RealmList<com.ninespartans.xmanager.model.ProgramData> dataManagedList = managedCopy.realmGet$data();
            dataManagedList.clear();
            for (int i = 0; i < dataUnmanagedList.size(); i++) {
                com.ninespartans.xmanager.model.ProgramData dataUnmanagedItem = dataUnmanagedList.get(i);
                com.ninespartans.xmanager.model.ProgramData cachedata = (com.ninespartans.xmanager.model.ProgramData) cache.get(dataUnmanagedItem);
                if (cachedata != null) {
                    throw new IllegalArgumentException("Embedded objects can only have one parent pointing to them. This object was already copied, so another object is pointing to it: cachedata.toString()");
                } else {
                    long objKey = dataManagedList.getOsList().createAndAddEmbeddedObject();
                    Row linkedObjectRow = realm.getTable(com.ninespartans.xmanager.model.ProgramData.class).getUncheckedRow(objKey);
                    com.ninespartans.xmanager.model.ProgramData linkedObject = com_ninespartans_xmanager_model_ProgramDataRealmProxy.newProxyInstance(realm, linkedObjectRow);
                    cache.put(dataUnmanagedItem, (RealmObjectProxy) linkedObject);
                    com_ninespartans_xmanager_model_ProgramDataRealmProxy.updateEmbeddedObject(realm, dataUnmanagedItem, linkedObject, new HashMap<RealmModel, RealmObjectProxy>(), Collections.EMPTY_SET);
                }
            }
        }

        com.ninespartans.xmanager.model.User creatorObj = unmanagedSource.realmGet$creator();
        if (creatorObj == null) {
            managedCopy.realmSet$creator(null);
        } else {
            com.ninespartans.xmanager.model.User cachecreator = (com.ninespartans.xmanager.model.User) cache.get(creatorObj);
            if (cachecreator != null) {
                managedCopy.realmSet$creator(cachecreator);
            } else {
                managedCopy.realmSet$creator(com_ninespartans_xmanager_model_UserRealmProxy.copyOrUpdate(realm, (com_ninespartans_xmanager_model_UserRealmProxy.UserColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.User.class), creatorObj, update, cache, flags));
            }
        }

        return managedCopy;
    }

    public static long insert(Realm realm, com.ninespartans.xmanager.model.DeviceProgram object, Map<RealmModel,Long> cache) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
            return ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey();
        }
        Table table = realm.getTable(com.ninespartans.xmanager.model.DeviceProgram.class);
        long tableNativePtr = table.getNativePtr();
        DeviceProgramColumnInfo columnInfo = (DeviceProgramColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.DeviceProgram.class);
        long pkColumnKey = columnInfo._idColKey;
        long objKey = Table.NO_MATCH;
        Object primaryKeyValue = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$_id();
        if (primaryKeyValue != null) {
            objKey = Table.nativeFindFirstObjectId(tableNativePtr, pkColumnKey, ((org.bson.types.ObjectId)primaryKeyValue).toString());
        }
        if (objKey == Table.NO_MATCH) {
            objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
        } else {
            Table.throwDuplicatePrimaryKeyException(primaryKeyValue);
        }
        cache.put(object, objKey);
        String realmGet$title = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$title();
        if (realmGet$title != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.titleColKey, objKey, realmGet$title, false);
        }
        String realmGet$description = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$description();
        if (realmGet$description != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.descriptionColKey, objKey, realmGet$description, false);
        }
        Table.nativeSetBoolean(tableNativePtr, columnInfo.activeColKey, objKey, ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$active(), false);

        RealmList<com.ninespartans.xmanager.model.ProgramData> dataList = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$data();
        if (dataList != null) {
            OsList dataOsList = new OsList(table.getUncheckedRow(objKey), columnInfo.dataColKey);
            for (com.ninespartans.xmanager.model.ProgramData dataItem : dataList) {
                Long cacheItemIndexdata = cache.get(dataItem);
                if (cacheItemIndexdata != null) {
                    throw new IllegalArgumentException("Embedded objects can only have one parent pointing to them. This object was already copied, so another object is pointing to it: " + cacheItemIndexdata.toString());
                } else {
                    cacheItemIndexdata = com_ninespartans_xmanager_model_ProgramDataRealmProxy.insert(realm, table, columnInfo.dataColKey, objKey, dataItem, cache);
                }
            }
        }

        com.ninespartans.xmanager.model.User creatorObj = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$creator();
        if (creatorObj != null) {
            Long cachecreator = cache.get(creatorObj);
            if (cachecreator == null) {
                cachecreator = com_ninespartans_xmanager_model_UserRealmProxy.insert(realm, creatorObj, cache);
            }
            Table.nativeSetLink(tableNativePtr, columnInfo.creatorColKey, objKey, cachecreator, false);
        }
        java.util.Date realmGet$startDate = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$startDate();
        if (realmGet$startDate != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.startDateColKey, objKey, realmGet$startDate.getTime(), false);
        }
        java.util.Date realmGet$createdAt = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$createdAt();
        if (realmGet$createdAt != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.createdAtColKey, objKey, realmGet$createdAt.getTime(), false);
        }
        java.util.Date realmGet$updatedAt = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$updatedAt();
        if (realmGet$updatedAt != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.updatedAtColKey, objKey, realmGet$updatedAt.getTime(), false);
        }
        return objKey;
    }

    public static void insert(Realm realm, Iterator<? extends RealmModel> objects, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(com.ninespartans.xmanager.model.DeviceProgram.class);
        long tableNativePtr = table.getNativePtr();
        DeviceProgramColumnInfo columnInfo = (DeviceProgramColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.DeviceProgram.class);
        long pkColumnKey = columnInfo._idColKey;
        com.ninespartans.xmanager.model.DeviceProgram object = null;
        while (objects.hasNext()) {
            object = (com.ninespartans.xmanager.model.DeviceProgram) objects.next();
            if (cache.containsKey(object)) {
                continue;
            }
            if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
                cache.put(object, ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey());
                continue;
            }
            long objKey = Table.NO_MATCH;
            Object primaryKeyValue = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$_id();
            if (primaryKeyValue != null) {
                objKey = Table.nativeFindFirstObjectId(tableNativePtr, pkColumnKey, ((org.bson.types.ObjectId)primaryKeyValue).toString());
            }
            if (objKey == Table.NO_MATCH) {
                objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
            } else {
                Table.throwDuplicatePrimaryKeyException(primaryKeyValue);
            }
            cache.put(object, objKey);
            String realmGet$title = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$title();
            if (realmGet$title != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.titleColKey, objKey, realmGet$title, false);
            }
            String realmGet$description = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$description();
            if (realmGet$description != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.descriptionColKey, objKey, realmGet$description, false);
            }
            Table.nativeSetBoolean(tableNativePtr, columnInfo.activeColKey, objKey, ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$active(), false);

            RealmList<com.ninespartans.xmanager.model.ProgramData> dataList = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$data();
            if (dataList != null) {
                OsList dataOsList = new OsList(table.getUncheckedRow(objKey), columnInfo.dataColKey);
                for (com.ninespartans.xmanager.model.ProgramData dataItem : dataList) {
                    Long cacheItemIndexdata = cache.get(dataItem);
                    if (cacheItemIndexdata != null) {
                        throw new IllegalArgumentException("Embedded objects can only have one parent pointing to them. This object was already copied, so another object is pointing to it: " + cacheItemIndexdata.toString());
                    } else {
                        cacheItemIndexdata = com_ninespartans_xmanager_model_ProgramDataRealmProxy.insert(realm, table, columnInfo.dataColKey, objKey, dataItem, cache);
                    }
                }
            }

            com.ninespartans.xmanager.model.User creatorObj = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$creator();
            if (creatorObj != null) {
                Long cachecreator = cache.get(creatorObj);
                if (cachecreator == null) {
                    cachecreator = com_ninespartans_xmanager_model_UserRealmProxy.insert(realm, creatorObj, cache);
                }
                Table.nativeSetLink(tableNativePtr, columnInfo.creatorColKey, objKey, cachecreator, false);
            }
            java.util.Date realmGet$startDate = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$startDate();
            if (realmGet$startDate != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.startDateColKey, objKey, realmGet$startDate.getTime(), false);
            }
            java.util.Date realmGet$createdAt = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$createdAt();
            if (realmGet$createdAt != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.createdAtColKey, objKey, realmGet$createdAt.getTime(), false);
            }
            java.util.Date realmGet$updatedAt = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$updatedAt();
            if (realmGet$updatedAt != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.updatedAtColKey, objKey, realmGet$updatedAt.getTime(), false);
            }
        }
    }

    public static long insertOrUpdate(Realm realm, com.ninespartans.xmanager.model.DeviceProgram object, Map<RealmModel,Long> cache) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
            return ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey();
        }
        Table table = realm.getTable(com.ninespartans.xmanager.model.DeviceProgram.class);
        long tableNativePtr = table.getNativePtr();
        DeviceProgramColumnInfo columnInfo = (DeviceProgramColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.DeviceProgram.class);
        long pkColumnKey = columnInfo._idColKey;
        long objKey = Table.NO_MATCH;
        Object primaryKeyValue = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$_id();
        if (primaryKeyValue != null) {
            objKey = Table.nativeFindFirstObjectId(tableNativePtr, pkColumnKey, ((org.bson.types.ObjectId)primaryKeyValue).toString());
        }
        if (objKey == Table.NO_MATCH) {
            objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
        }
        cache.put(object, objKey);
        String realmGet$title = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$title();
        if (realmGet$title != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.titleColKey, objKey, realmGet$title, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.titleColKey, objKey, false);
        }
        String realmGet$description = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$description();
        if (realmGet$description != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.descriptionColKey, objKey, realmGet$description, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.descriptionColKey, objKey, false);
        }
        Table.nativeSetBoolean(tableNativePtr, columnInfo.activeColKey, objKey, ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$active(), false);

        OsList dataOsList = new OsList(table.getUncheckedRow(objKey), columnInfo.dataColKey);
        RealmList<com.ninespartans.xmanager.model.ProgramData> dataList = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$data();
        dataOsList.removeAll();
        if (dataList != null) {
            for (com.ninespartans.xmanager.model.ProgramData dataItem : dataList) {
                Long cacheItemIndexdata = cache.get(dataItem);
                if (cacheItemIndexdata != null) {
                    throw new IllegalArgumentException("Embedded objects can only have one parent pointing to them. This object was already copied, so another object is pointing to it: " + cacheItemIndexdata.toString());
                } else {
                    cacheItemIndexdata = com_ninespartans_xmanager_model_ProgramDataRealmProxy.insertOrUpdate(realm, table, columnInfo.dataColKey, objKey, dataItem, cache);
                }
            }
        }


        com.ninespartans.xmanager.model.User creatorObj = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$creator();
        if (creatorObj != null) {
            Long cachecreator = cache.get(creatorObj);
            if (cachecreator == null) {
                cachecreator = com_ninespartans_xmanager_model_UserRealmProxy.insertOrUpdate(realm, creatorObj, cache);
            }
            Table.nativeSetLink(tableNativePtr, columnInfo.creatorColKey, objKey, cachecreator, false);
        } else {
            Table.nativeNullifyLink(tableNativePtr, columnInfo.creatorColKey, objKey);
        }
        java.util.Date realmGet$startDate = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$startDate();
        if (realmGet$startDate != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.startDateColKey, objKey, realmGet$startDate.getTime(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.startDateColKey, objKey, false);
        }
        java.util.Date realmGet$createdAt = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$createdAt();
        if (realmGet$createdAt != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.createdAtColKey, objKey, realmGet$createdAt.getTime(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.createdAtColKey, objKey, false);
        }
        java.util.Date realmGet$updatedAt = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$updatedAt();
        if (realmGet$updatedAt != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.updatedAtColKey, objKey, realmGet$updatedAt.getTime(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.updatedAtColKey, objKey, false);
        }
        return objKey;
    }

    public static void insertOrUpdate(Realm realm, Iterator<? extends RealmModel> objects, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(com.ninespartans.xmanager.model.DeviceProgram.class);
        long tableNativePtr = table.getNativePtr();
        DeviceProgramColumnInfo columnInfo = (DeviceProgramColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.DeviceProgram.class);
        long pkColumnKey = columnInfo._idColKey;
        com.ninespartans.xmanager.model.DeviceProgram object = null;
        while (objects.hasNext()) {
            object = (com.ninespartans.xmanager.model.DeviceProgram) objects.next();
            if (cache.containsKey(object)) {
                continue;
            }
            if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
                cache.put(object, ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey());
                continue;
            }
            long objKey = Table.NO_MATCH;
            Object primaryKeyValue = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$_id();
            if (primaryKeyValue != null) {
                objKey = Table.nativeFindFirstObjectId(tableNativePtr, pkColumnKey, ((org.bson.types.ObjectId)primaryKeyValue).toString());
            }
            if (objKey == Table.NO_MATCH) {
                objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
            }
            cache.put(object, objKey);
            String realmGet$title = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$title();
            if (realmGet$title != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.titleColKey, objKey, realmGet$title, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.titleColKey, objKey, false);
            }
            String realmGet$description = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$description();
            if (realmGet$description != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.descriptionColKey, objKey, realmGet$description, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.descriptionColKey, objKey, false);
            }
            Table.nativeSetBoolean(tableNativePtr, columnInfo.activeColKey, objKey, ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$active(), false);

            OsList dataOsList = new OsList(table.getUncheckedRow(objKey), columnInfo.dataColKey);
            RealmList<com.ninespartans.xmanager.model.ProgramData> dataList = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$data();
            dataOsList.removeAll();
            if (dataList != null) {
                for (com.ninespartans.xmanager.model.ProgramData dataItem : dataList) {
                    Long cacheItemIndexdata = cache.get(dataItem);
                    if (cacheItemIndexdata != null) {
                        throw new IllegalArgumentException("Embedded objects can only have one parent pointing to them. This object was already copied, so another object is pointing to it: " + cacheItemIndexdata.toString());
                    } else {
                        cacheItemIndexdata = com_ninespartans_xmanager_model_ProgramDataRealmProxy.insertOrUpdate(realm, table, columnInfo.dataColKey, objKey, dataItem, cache);
                    }
                }
            }


            com.ninespartans.xmanager.model.User creatorObj = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$creator();
            if (creatorObj != null) {
                Long cachecreator = cache.get(creatorObj);
                if (cachecreator == null) {
                    cachecreator = com_ninespartans_xmanager_model_UserRealmProxy.insertOrUpdate(realm, creatorObj, cache);
                }
                Table.nativeSetLink(tableNativePtr, columnInfo.creatorColKey, objKey, cachecreator, false);
            } else {
                Table.nativeNullifyLink(tableNativePtr, columnInfo.creatorColKey, objKey);
            }
            java.util.Date realmGet$startDate = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$startDate();
            if (realmGet$startDate != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.startDateColKey, objKey, realmGet$startDate.getTime(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.startDateColKey, objKey, false);
            }
            java.util.Date realmGet$createdAt = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$createdAt();
            if (realmGet$createdAt != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.createdAtColKey, objKey, realmGet$createdAt.getTime(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.createdAtColKey, objKey, false);
            }
            java.util.Date realmGet$updatedAt = ((com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) object).realmGet$updatedAt();
            if (realmGet$updatedAt != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.updatedAtColKey, objKey, realmGet$updatedAt.getTime(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.updatedAtColKey, objKey, false);
            }
        }
    }

    public static com.ninespartans.xmanager.model.DeviceProgram createDetachedCopy(com.ninespartans.xmanager.model.DeviceProgram realmObject, int currentDepth, int maxDepth, Map<RealmModel, CacheData<RealmModel>> cache) {
        if (currentDepth > maxDepth || realmObject == null) {
            return null;
        }
        CacheData<RealmModel> cachedObject = cache.get(realmObject);
        com.ninespartans.xmanager.model.DeviceProgram unmanagedObject;
        if (cachedObject == null) {
            unmanagedObject = new com.ninespartans.xmanager.model.DeviceProgram();
            cache.put(realmObject, new RealmObjectProxy.CacheData<RealmModel>(currentDepth, unmanagedObject));
        } else {
            // Reuse cached object or recreate it because it was encountered at a lower depth.
            if (currentDepth >= cachedObject.minDepth) {
                return (com.ninespartans.xmanager.model.DeviceProgram) cachedObject.object;
            }
            unmanagedObject = (com.ninespartans.xmanager.model.DeviceProgram) cachedObject.object;
            cachedObject.minDepth = currentDepth;
        }
        com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface unmanagedCopy = (com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) unmanagedObject;
        com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface realmSource = (com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) realmObject;
        Realm objectRealm = (Realm) ((RealmObjectProxy) realmObject).realmGet$proxyState().getRealm$realm();
        unmanagedCopy.realmSet$_id(realmSource.realmGet$_id());
        unmanagedCopy.realmSet$title(realmSource.realmGet$title());
        unmanagedCopy.realmSet$description(realmSource.realmGet$description());
        unmanagedCopy.realmSet$active(realmSource.realmGet$active());

        // Deep copy of data
        if (currentDepth == maxDepth) {
            unmanagedCopy.realmSet$data(null);
        } else {
            RealmList<com.ninespartans.xmanager.model.ProgramData> manageddataList = realmSource.realmGet$data();
            RealmList<com.ninespartans.xmanager.model.ProgramData> unmanageddataList = new RealmList<com.ninespartans.xmanager.model.ProgramData>();
            unmanagedCopy.realmSet$data(unmanageddataList);
            int nextDepth = currentDepth + 1;
            int size = manageddataList.size();
            for (int i = 0; i < size; i++) {
                com.ninespartans.xmanager.model.ProgramData item = com_ninespartans_xmanager_model_ProgramDataRealmProxy.createDetachedCopy(manageddataList.get(i), nextDepth, maxDepth, cache);
                unmanageddataList.add(item);
            }
        }

        // Deep copy of creator
        unmanagedCopy.realmSet$creator(com_ninespartans_xmanager_model_UserRealmProxy.createDetachedCopy(realmSource.realmGet$creator(), currentDepth + 1, maxDepth, cache));
        unmanagedCopy.realmSet$startDate(realmSource.realmGet$startDate());
        unmanagedCopy.realmSet$createdAt(realmSource.realmGet$createdAt());
        unmanagedCopy.realmSet$updatedAt(realmSource.realmGet$updatedAt());

        return unmanagedObject;
    }

    static com.ninespartans.xmanager.model.DeviceProgram update(Realm realm, DeviceProgramColumnInfo columnInfo, com.ninespartans.xmanager.model.DeviceProgram realmObject, com.ninespartans.xmanager.model.DeviceProgram newObject, Map<RealmModel, RealmObjectProxy> cache, Set<ImportFlag> flags) {
        com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface realmObjectTarget = (com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) realmObject;
        com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface realmObjectSource = (com_ninespartans_xmanager_model_DeviceProgramRealmProxyInterface) newObject;
        Table table = realm.getTable(com.ninespartans.xmanager.model.DeviceProgram.class);
        OsObjectBuilder builder = new OsObjectBuilder(table, flags);
        builder.addObjectId(columnInfo._idColKey, realmObjectSource.realmGet$_id());
        builder.addString(columnInfo.titleColKey, realmObjectSource.realmGet$title());
        builder.addString(columnInfo.descriptionColKey, realmObjectSource.realmGet$description());
        builder.addBoolean(columnInfo.activeColKey, realmObjectSource.realmGet$active());

        RealmList<com.ninespartans.xmanager.model.ProgramData> dataUnmanagedList = realmObjectSource.realmGet$data();
        if (dataUnmanagedList != null) {
            RealmList<com.ninespartans.xmanager.model.ProgramData> dataManagedCopy = new RealmList<com.ninespartans.xmanager.model.ProgramData>();
            OsList targetList = realmObjectTarget.realmGet$data().getOsList();
            targetList.deleteAll();
            for (int i = 0; i < dataUnmanagedList.size(); i++) {
                com.ninespartans.xmanager.model.ProgramData dataUnmanagedItem = dataUnmanagedList.get(i);
                com.ninespartans.xmanager.model.ProgramData cachedata = (com.ninespartans.xmanager.model.ProgramData) cache.get(dataUnmanagedItem);
                if (cachedata != null) {
                    throw new IllegalArgumentException("Embedded objects can only have one parent pointing to them. This object was already copied, so another object is pointing to it: cachedata.toString()");
                } else {
                    long objKey = targetList.createAndAddEmbeddedObject();
                    Row row = realm.getTable(com.ninespartans.xmanager.model.ProgramData.class).getUncheckedRow(objKey);
                    com.ninespartans.xmanager.model.ProgramData proxyObject = com_ninespartans_xmanager_model_ProgramDataRealmProxy.newProxyInstance(realm, row);
                    cache.put(dataUnmanagedItem, (RealmObjectProxy) proxyObject);
                    dataManagedCopy.add(proxyObject);
                    com_ninespartans_xmanager_model_ProgramDataRealmProxy.updateEmbeddedObject(realm, dataUnmanagedItem, proxyObject, new HashMap<RealmModel, RealmObjectProxy>(), Collections.EMPTY_SET);
                }
            }
        } else {
            builder.addObjectList(columnInfo.dataColKey, new RealmList<com.ninespartans.xmanager.model.ProgramData>());
        }

        com.ninespartans.xmanager.model.User creatorObj = realmObjectSource.realmGet$creator();
        if (creatorObj == null) {
            builder.addNull(columnInfo.creatorColKey);
        } else {
            com.ninespartans.xmanager.model.User cachecreator = (com.ninespartans.xmanager.model.User) cache.get(creatorObj);
            if (cachecreator != null) {
                builder.addObject(columnInfo.creatorColKey, cachecreator);
            } else {
                builder.addObject(columnInfo.creatorColKey, com_ninespartans_xmanager_model_UserRealmProxy.copyOrUpdate(realm, (com_ninespartans_xmanager_model_UserRealmProxy.UserColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.User.class), creatorObj, true, cache, flags));
            }
        }
        builder.addDate(columnInfo.startDateColKey, realmObjectSource.realmGet$startDate());
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
        StringBuilder stringBuilder = new StringBuilder("DeviceProgram = proxy[");
        stringBuilder.append("{_id:");
        stringBuilder.append(realmGet$_id());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{title:");
        stringBuilder.append(realmGet$title());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{description:");
        stringBuilder.append(realmGet$description());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{active:");
        stringBuilder.append(realmGet$active());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{data:");
        stringBuilder.append("RealmList<ProgramData>[").append(realmGet$data().size()).append("]");
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{creator:");
        stringBuilder.append(realmGet$creator() != null ? "User" : "null");
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{startDate:");
        stringBuilder.append(realmGet$startDate() != null ? realmGet$startDate() : "null");
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{createdAt:");
        stringBuilder.append(realmGet$createdAt() != null ? realmGet$createdAt() : "null");
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{updatedAt:");
        stringBuilder.append(realmGet$updatedAt() != null ? realmGet$updatedAt() : "null");
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
        com_ninespartans_xmanager_model_DeviceProgramRealmProxy aDeviceProgram = (com_ninespartans_xmanager_model_DeviceProgramRealmProxy)o;

        BaseRealm realm = proxyState.getRealm$realm();
        BaseRealm otherRealm = aDeviceProgram.proxyState.getRealm$realm();
        String path = realm.getPath();
        String otherPath = otherRealm.getPath();
        if (path != null ? !path.equals(otherPath) : otherPath != null) return false;
        if (realm.isFrozen() != otherRealm.isFrozen()) return false;
        if (!realm.sharedRealm.getVersionID().equals(otherRealm.sharedRealm.getVersionID())) {
            return false;
        }

        String tableName = proxyState.getRow$realm().getTable().getName();
        String otherTableName = aDeviceProgram.proxyState.getRow$realm().getTable().getName();
        if (tableName != null ? !tableName.equals(otherTableName) : otherTableName != null) return false;

        if (proxyState.getRow$realm().getObjectKey() != aDeviceProgram.proxyState.getRow$realm().getObjectKey()) return false;

        return true;
    }
}
