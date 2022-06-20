package handlers

import (
	"database/sql"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/vesnateamgithub/poolarko/helpers"
	"github.com/vesnateamgithub/poolarko/models"
	"golang.org/x/exp/slices"
)

type PooldataHandler struct {
	db *sql.DB
}

type PooldataResponse struct {
	Pooltechnics       []models.Pooltechnics       `json:"pooltechnics_list"`
	Poolsize           []models.Poolsize           `json:"poolsize_list"`
	Pooledge           []models.Pooledge           `json:"pooledge_list"`
	Poolcolor          []models.Poolcolor          `json:"poolcolor_list"`
	Poolframecolor     []models.Poolcolor          `json:"poolframecolor_list"`
	PoolformStepsform  []models.PoolformStepsform  `json:"poolform_stepsform_list"`
	PoolformPoolbench  []models.PoolformPoolbench  `json:"poolform_poolbench_list"`
	Colorvari          []models.Colorvari          `json:"colorvari_list"`
	Skimmertype        []models.Skimmertype        `json:"skimmertype_list"`
	Poolwater          []models.Poolwater          `json:"poolwater_list"`
	Electro            []models.Electro            `json:"electro_list"`
	Led                []models.Led                `json:"led_list"`
	Ledremote          []models.Ledremote          `json:"ledremote_list"`
	Staff              []models.Staff              `json:"staff_list"`
	Technicsboxchanges []models.Technicsboxchanges `json:"technicsboxchanges_list"`
}

func NewPooldataHandler(db *sql.DB) *PooldataHandler {
	return &PooldataHandler{
		db: db,
	}
}

func (h *PooldataHandler) ListHandler(c *gin.Context) {
	// get the data
	pooltechnicsList, err := h.PooltechnicsList()
	if err != nil {
		helpers.RespondWithError(c, http.StatusInternalServerError, err.Error())
		return
	}

	poolsizeList, err := h.PoolsizeList()
	if err != nil {
		helpers.RespondWithError(c, http.StatusInternalServerError, err.Error())
		return
	}

	pooledgeList, err := h.PooledgeList()
	if err != nil {
		helpers.RespondWithError(c, http.StatusInternalServerError, err.Error())
		return
	}

	poolcolorList, err := h.PoolcolorList()
	if err != nil {
		helpers.RespondWithError(c, http.StatusInternalServerError, err.Error())
		return
	}

	poolframecolorList, err := h.PoolframecolorList()
	if err != nil {
		helpers.RespondWithError(c, http.StatusInternalServerError, err.Error())
		return
	}

	poolformStepsformList, err := h.PoolformStepsformList()
	if err != nil {
		helpers.RespondWithError(c, http.StatusInternalServerError, err.Error())
		return
	}

	poolformPoolbenchList, err := h.PoolformPoolbenchList()
	if err != nil {
		helpers.RespondWithError(c, http.StatusInternalServerError, err.Error())
		return
	}

	colorvariList, err := h.ColorvariList()
	if err != nil {
		helpers.RespondWithError(c, http.StatusInternalServerError, err.Error())
		return
	}

	skimmertypeList, err := h.SkimmertypeList()
	if err != nil {
		helpers.RespondWithError(c, http.StatusInternalServerError, err.Error())
		return
	}

	poolwaterList, err := h.PoolwaterList()
	if err != nil {
		helpers.RespondWithError(c, http.StatusInternalServerError, err.Error())
		return
	}

	electroList, err := h.ElectroList()
	if err != nil {
		helpers.RespondWithError(c, http.StatusInternalServerError, err.Error())
		return
	}

	ledList, err := h.LedList()
	if err != nil {
		helpers.RespondWithError(c, http.StatusInternalServerError, err.Error())
		return
	}

	ledremoteList, err := h.LedremoteList()
	if err != nil {
		helpers.RespondWithError(c, http.StatusInternalServerError, err.Error())
		return
	}

	technicsboxchangesList, err := h.TechnicsboxchangesList()
	if err != nil {
		helpers.RespondWithError(c, http.StatusInternalServerError, err.Error())
		return
	}

	staffList, err := h.StaffList()
	if err != nil {
		helpers.RespondWithError(c, http.StatusInternalServerError, err.Error())
		return
	}

	// make the response
	pooldataResponse := PooldataResponse{
		Pooltechnics:       pooltechnicsList,
		Poolsize:           poolsizeList,
		Pooledge:           pooledgeList,
		Poolcolor:          poolcolorList,
		Poolframecolor:     poolframecolorList,
		PoolformStepsform:  poolformStepsformList,
		PoolformPoolbench:  poolformPoolbenchList,
		Colorvari:          colorvariList,
		Skimmertype:        skimmertypeList,
		Poolwater:          poolwaterList,
		Electro:            electroList,
		Led:                ledList,
		Ledremote:          ledremoteList,
		Staff:              staffList,
		Technicsboxchanges: technicsboxchangesList,
	}

	c.JSON(http.StatusOK, gin.H{
		"status": http.StatusOK,
		"data":   pooldataResponse,
	})
}

func (h *PooldataHandler) PooltechnicsList() ([]models.Pooltechnics, error) {

	rows, err := h.db.Query("select * from pooltechnics order by id")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	list := make([]models.Pooltechnics, 0)
	for rows.Next() {
		var r models.Pooltechnics
		if err := rows.Scan(&r.ID, &r.Name, &r.Number, &r.PriceAt, &r.PriceDe, &r.PriceCh, &r.Desc, &r.CreatedAt, &r.UpdatedAt); err != nil {
			return nil, err
		}
		list = append(list, r)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return list, nil
}

func (h *PooldataHandler) PoolsizeList() ([]models.Poolsize, error) {

	rows, err := h.db.Query("select * from poolsizes order by id")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	list := make([]models.Poolsize, 0)
	for rows.Next() {
		var r models.Poolsize
		if err := rows.Scan(&r.ID, &r.Name, &r.Number, &r.Length, &r.Width, &r.PriceAt, &r.PriceDe, &r.PriceCh, &r.Desc, &r.CreatedAt, &r.UpdatedAt); err != nil {
			return nil, err
		}
		list = append(list, r)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return list, nil
}

func (h *PooldataHandler) PooledgeList() ([]models.Pooledge, error) {

	rows, err := h.db.Query("select * from pooledges order by id")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	list := make([]models.Pooledge, 0)
	for rows.Next() {
		var r models.Pooledge
		if err := rows.Scan(&r.ID, &r.PooltypeID, &r.Name, &r.Number, &r.PriceAt, &r.PriceDe, &r.PriceCh, &r.Desc, &r.CreatedAt, &r.UpdatedAt); err != nil {
			return nil, err
		}
		list = append(list, r)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return list, nil
}

func (h *PooldataHandler) PoolcolorList() ([]models.Poolcolor, error) {

	rows, err := h.db.Query("select * from poolcolors order by id")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	list := make([]models.Poolcolor, 0)
	for rows.Next() {
		var r models.Poolcolor
		if err := rows.Scan(&r.ID, &r.Name, &r.Number, &r.Value, &r.CreatedAt, &r.UpdatedAt); err != nil {
			return nil, err
		}
		list = append(list, r)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return list, nil
}

func (h *PooldataHandler) PoolframecolorList() ([]models.Poolcolor, error) {

	rows, err := h.db.Query("select * from poolframecolors order by id")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	list := make([]models.Poolcolor, 0)
	for rows.Next() {
		var r models.Poolcolor
		if err := rows.Scan(&r.ID, &r.Name, &r.Number, &r.Value, &r.CreatedAt, &r.UpdatedAt); err != nil {
			return nil, err
		}
		list = append(list, r)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return list, nil
}

func (h *PooldataHandler) PoolformStepsformList() ([]models.PoolformStepsform, error) {

	rows, err := h.db.Query("select * from poolform_stepsform order by poolform_id, stepsform_id")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	list := make([]models.PoolformStepsform, 0)
	for rows.Next() {
		var r models.PoolformStepsform
		if err := rows.Scan(&r.PoolformID, &r.StepsformID, &r.Pos, &r.CreatedAt, &r.UpdatedAt); err != nil {
			return nil, err
		}
		list = append(list, r)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return list, nil
}

func (h *PooldataHandler) PoolformPoolbenchList() ([]models.PoolformPoolbench, error) {

	rows, err := h.db.Query("select * from poolform_poolbench order by poolform_id, poolbench_id")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	list := make([]models.PoolformPoolbench, 0)
	for rows.Next() {
		var r models.PoolformPoolbench
		if err := rows.Scan(&r.PoolformID, &r.PoolbenchID, &r.Pos, &r.CreatedAt, &r.UpdatedAt); err != nil {
			return nil, err
		}
		list = append(list, r)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return list, nil
}

func (h *PooldataHandler) ColorvariList() ([]models.Colorvari, error) {
	rows, err := h.db.Query("select * from colorvaris order by id")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	list := make([]models.Colorvari, 0)
	for rows.Next() {
		var r models.Colorvari
		if err := rows.Scan(&r.ID, &r.Name, &r.Number, &r.PriceAt, &r.PriceDe, &r.PriceCh, &r.Desc, &r.Image, &r.CreatedAt, &r.UpdatedAt); err != nil {
			return nil, err
		}
		list = append(list, r)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return list, nil
}

func (h *PooldataHandler) SkimmertypeList() ([]models.Skimmertype, error) {
	rows, err := h.db.Query("select * from skimmertypes order by id")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	list := make([]models.Skimmertype, 0)
	for rows.Next() {
		var r models.Skimmertype
		if err := rows.Scan(&r.ID, &r.Name, &r.Number, &r.PriceAt, &r.PriceDe, &r.PriceCh, &r.Desc, &r.Image, &r.CreatedAt, &r.UpdatedAt); err != nil {
			return nil, err
		}
		list = append(list, r)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return list, nil
}

func (h *PooldataHandler) PoolwaterList() ([]models.Poolwater, error) {
	// get the ventil list
	ventilList, err := h.VentilList()
	if err != nil {
		return nil, err
	}

	// read poolwater and if there is a ventil add it to the list
	rows, err := h.db.Query("select poolwaters.*, ventil_id from poolwaters left join poolwater_ventil on poolwaters.id = poolwater_id order by poolwaters.id")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	list := make([]models.Poolwater, 0)
	for rows.Next() {
		var r models.Poolwater
		var ventilID sql.NullInt32
		log.Println("daki1")
		if err := rows.Scan(&r.ID, &r.Name, &r.Number, &r.PriceAt, &r.PriceDe, &r.PriceCh, &r.Desc1,
			&r.Desc2, &r.Desc3, &r.Desc4, &r.Desc5, &r.Image, &r.CreatedAt, &r.UpdatedAt, &ventilID); err != nil {
			return nil, err
		}
		log.Println("daki2", ventilID)
		if ventilID.Valid {
			index := slices.IndexFunc(ventilList, func(v models.Ventil) bool { return v.ID == ventilID.Int32 })
			if index >= 0 {
				r.Ventil = append(r.Ventil, ventilList[index])
			}
		} else {
			r.Ventil = make([]models.Ventil, 0)
		}
		list = append(list, r)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return list, nil
}

func (h *PooldataHandler) VentilList() ([]models.Ventil, error) {
	rows, err := h.db.Query("select * from ventils order by id")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	list := make([]models.Ventil, 0)
	for rows.Next() {
		var r models.Ventil
		if err := rows.Scan(&r.ID, &r.Name, &r.Number, &r.PriceAt, &r.PriceDe, &r.PriceCh, &r.Desc1, &r.Image, &r.CreatedAt, &r.UpdatedAt); err != nil {
			return nil, err
		}
		list = append(list, r)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return list, nil
}

func (h *PooldataHandler) ElectroList() ([]models.Electro, error) {
	rows, err := h.db.Query("select * from electros order by id")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	list := make([]models.Electro, 0)
	for rows.Next() {
		var r models.Electro
		if err := rows.Scan(&r.ID, &r.Name, &r.Number, &r.PriceAt, &r.PriceDe, &r.PriceCh, &r.Desc1, &r.Image, &r.CreatedAt, &r.UpdatedAt); err != nil {
			return nil, err
		}
		list = append(list, r)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return list, nil
}

func (h *PooldataHandler) WhirlpoolList() ([]models.Whirlpool, error) {
	rows, err := h.db.Query("select * from whirlpools order by id")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	list := make([]models.Whirlpool, 0)
	for rows.Next() {
		var r models.Whirlpool
		if err := rows.Scan(&r.ID, &r.Name, &r.Number, &r.PriceAt, &r.PriceDe, &r.PriceCh, &r.Desc1, &r.Image, &r.CreatedAt, &r.UpdatedAt); err != nil {
			return nil, err
		}
		list = append(list, r)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return list, nil
}

func (h *PooldataHandler) LedList() ([]models.Led, error) {
	rows, err := h.db.Query("select * from leds order by id")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	list := make([]models.Led, 0)
	for rows.Next() {
		var r models.Led
		if err := rows.Scan(&r.ID, &r.Name, &r.Number, &r.PriceAt, &r.PriceDe, &r.PriceCh, &r.Desc1, &r.Image, &r.HasRemote, &r.CreatedAt, &r.UpdatedAt); err != nil {
			return nil, err
		}
		list = append(list, r)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return list, nil
}

func (h *PooldataHandler) LedremoteList() ([]models.Ledremote, error) {
	rows, err := h.db.Query("select * from ledremotes order by id")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	list := make([]models.Ledremote, 0)
	for rows.Next() {
		var r models.Ledremote
		if err := rows.Scan(&r.ID, &r.Name, &r.Number, &r.PriceAt, &r.PriceDe, &r.PriceCh, &r.Desc1, &r.CreatedAt, &r.UpdatedAt); err != nil {
			return nil, err
		}
		list = append(list, r)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return list, nil
}

func (h *PooldataHandler) TechnicsboxchangesList() ([]models.Technicsboxchanges, error) {
	rows, err := h.db.Query("select * from technicsboxchanges order by id")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	list := make([]models.Technicsboxchanges, 0)
	for rows.Next() {
		var r models.Technicsboxchanges
		if err := rows.Scan(&r.ID, &r.Name, &r.Number, &r.PriceAt, &r.PriceDe, &r.PriceCh, &r.Desc1, &r.CreatedAt, &r.UpdatedAt); err != nil {
			return nil, err
		}
		list = append(list, r)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return list, nil
}

func (h *PooldataHandler) StaffList() ([]models.Staff, error) {
	rows, err := h.db.Query("select id, name from users where role_id <= 2 order by id")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	list := make([]models.Staff, 0)
	for rows.Next() {
		var r models.Staff
		if err := rows.Scan(&r.ID, &r.Name); err != nil {
			return nil, err
		}
		list = append(list, r)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return list, nil
}
